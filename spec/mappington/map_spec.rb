require 'spec_helper'

describe Mappington::Map do
	subject do
		Mappington::Map.new(
			:size => [320, 240],
			:center_on => 'the Eiffel Tower',
			:zoom_level => 10,
			:image_format => :png,
			:map_type => :roadmap,
			:scale => 1,
			:language => :en,
			:region => :us)
	end
	it 'should have a size' do
		subject.size.should be_a Mappington::Size
		subject.size.to_s.should eq '320x240'
	end

	it 'can have a center' do
		subject.center.should be_a Mappington::Point
		subject.center.to_s.should eq 'the Eiffel Tower'
	end
	it 'can have a zoom level' do
		subject.zoom_level.should eq 10
	end

	it 'can have an image format' do
		subject.image_format.should eq :png
	end
	it 'can have a map type' do
		subject.map_type.should eq :roadmap
	end
	it 'can have a scale' do
		subject.scale.should eq 1
	end

	it 'can have language' do
		subject.language.should eq :en
	end
	it 'can have a region' do
		subject.region.should eq :us
	end

	it 'can be using a positioning sensor' do
		subject.sensor.should eq false
	end

	it 'can have markers' do
		subject.markers << Mappington::Marker.new(:at => 'the Eiffel Tower')
		subject.markers.should have(1).item
	end
	it 'can have paths' do
		subject.paths << Mappington::Path.new(:points => ['the Eiffel Tower', 'the Grand Canyon'])
		subject.paths.should have(1).item
	end

	context 'Becoming a URI' do
		it 'should raise an error if it does not have a center and zoom, any markers, or any paths' do
			subject.center = nil
			subject.zoom_level = nil
			subject.markers = []
			subject.paths = []
			expect {subject.to_s}.to raise_error Mappington::MapError
		end
		it 'should become a URI if it has a center and zoom' do
			subject.center = Mappington::Point.new [0, 0]
			subject.zoom_level = 10
			subject.markers = []
			subject.paths = []
			subject.to_s.should eq 'http://maps.googleapis.com/maps/api/staticmap?size=320x240center=0,0&zoom=10&false'
		end
		it 'should become a URI if it has at least one marker' do
			subject.center = nil
			subject.zoom_level = nil
			subject.markers = [Mappington::Marker.new(:at => 'the Eiffel Tower')]
			subject.paths = []
			subject.to_s.should eq 'http://maps.googleapis.com/maps/api/staticmap?size=320x240&markers=color%3A%7Clabel%3A%7Cthe+Eiffel+Tower&false'
		end
		it 'should become a URI if it has at least one path' do
			subject.center = nil
			subject.zoom_level = nil
			subject.markers = []
			subject.paths = [Mappington::Path.new(:points => ['the Eiffel Tower', 'the Grand Canyon'])]
			subject.to_s.should eq 'http://maps.googleapis.com/maps/api/staticmap?size=320x240&path=color%3Ablack%7Cweight%3A1%7Cthe+Eiffel+Tower%7Cthe+Grand+Canyon&false'
		end
	end
end