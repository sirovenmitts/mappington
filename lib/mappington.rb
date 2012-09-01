require 'mappington/version'

require 'mappington/point'
require 'mappington/point_list'

require 'mappington/size'

require 'mappington/path'
require 'mappington/marker'
require 'mappington/map'

require 'mappington/path_error'
require 'mappington/map_error'

module Mappington
	# Quickly generate a URI for an address or coordinate. The map uses
	# default values for everything, and will have a marker centered on
	# +place+.
	def self.uri_for place
		Map.new(
			:size => [320, 240],
			:center_on => place,
			:zoom_level => 15,
			:markers => [Marker.new(:at => place)]).to_s
	end
end