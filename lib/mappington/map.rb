require 'cgi'

require 'rubygems'
require 'bundler/setup'
require 'hashie'
require 'hashie/extensions/coercion'

require 'mappington/size'

module Mappington
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

		def to_s
			raise MapError.new if (center.nil? || zoom_level.nil?) && markers.empty? && paths.empty?
			result = 'http://maps.googleapis.com/maps/api/staticmap?size=%s' % size
			result << 'center=%s&zoom=%s' % [center, zoom_level] if center && zoom_level
			result << '&' + markers.join('&') unless markers.empty?
			result << '&' + paths.join('&') unless paths.empty?
			result
		end
	end
end