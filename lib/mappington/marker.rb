require 'cgi'

require 'rubygems'
require 'bundler/setup'
require 'hashie'
require 'hashie/extensions/coercion'

require 'mappington/point'

module Mappington
	# A Marker calls out a point on the map. The Marker can
	# have a color, and can be brandished with a single
	# uppercase letter or number.
	#
	# NOTE: Marker does not raise an error when you label it
	# with a long string or with lowercase letters; the string
	# will be truncated to a single character, and will be
	# converted to uppercase.
	class Marker < Hashie::Trash
		include Hashie::Extensions::Coercion
		property :point, :required => true, :from => :at
		coerce_key :point, Point
		property :color
		property :label, :with => lambda {|label| label.is_a?(String) ? label[0].upcase : ''}

		def to_s
			'markers=%s' % CGI.escape('color:%s|label:%s|%s' % [color, label, point])
		end
	end
end