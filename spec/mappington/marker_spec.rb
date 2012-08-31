require 'spec_helper'

describe Mappington::Marker do
	subject {Mappington::Marker.new :at => 'the Eiffel Tower', :color => :green, :label => 'A'}
	it 'should have a point' do
		subject.point.should be_a Mappington::Point
		subject.point.to_s.should eq 'the Eiffel Tower'
	end
	it 'can have a color' do
		subject.color.should eq :green
	end
	it 'can have a single letter or number label' do
		subject.label.should eq 'A'
	end
	context 'Becoming a URI fragment' do
		it 'should become a URI fragment' do
			subject.to_s.should eq 'markers=color%3Agreen%7Clabel%3AA%7Cthe+Eiffel+Tower'

			marker = Mappington::Marker.new :at => [0, 0], :color => :green, :label => 'A'
			marker.to_s.should eq 'markers=color%3Agreen%7Clabel%3AA%7C0%2C0'
		end
	end
end