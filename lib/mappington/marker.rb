require 'cgi'

require 'rubygems'
require 'bundler/setup'
require 'hashie'
require 'hashie/extensions/coercion'

require 'mappington/point'

module Mappington
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