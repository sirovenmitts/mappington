require 'cgi'

require 'rubygems'
require 'bundler/setup'
require 'hashie'
require 'hashie/extensions/coercion'

require 'mappington/size'

module Mappington
	# A Map generates a URI pointing to a map made by Google. You
	# must give Map at least a point to center on and a zoom level,
	# or 1 or more markers or paths. You must also tell Map how
	# big an image it should render.
	# 
	# You can change some other settings, such as which language the
	# Google map should be in, what image format Google should return,
	# and what kind of map should appear.
	class Map < Hashie::Trash
		include Hashie::Extensions::Coercion

		property :size, :required => true
		coerce_key :size, Size

		property :center, :from => :center_on
		coerce_key :center, Point
		property :zoom_level

		property :markers, :default => []
		property :paths, :default => []

		property :image_format
		property :map_type
		property :scale
		property :language
		property :region
		property :sensor, :default => false

		def to_s
			raise MapError.new if (center.nil? || zoom_level.nil?) && markers.empty? && paths.empty?
			result = 'http://maps.googleapis.com/maps/api/staticmap?size=%s' % size
			result << 'center=%s&zoom=%s' % [center, zoom_level] if center && zoom_level
			result << '&' + markers.join('&') unless markers.empty?
			result << '&' + paths.join('&') unless paths.empty?
			result << '&' + sensor.to_s
			raise MapError.new if result.length > 2048
			result
		end
	end
end