require 'rubygems'
require 'bundler/setup'
require 'hashie'
require 'hashie/extensions/coercion'

require 'mappington/point_list'
require 'mappington/path_error'

module Mappington
	class Path < Hashie::Dash
		include Hashie::Extensions::Coercion
		property :stroke_color, :default => :black
		property :stroke_weight, :default => 1
		property :points, :default => []
		coerce_key :points, PointList

		def to_s
			raise PathError.new 'Paths must have 2 or more points.' if points.count < 2
			'path=%s' % CGI.escape('color:%s|weight:%s|%s' % [stroke_color, stroke_weight, points])
		end
	end
end