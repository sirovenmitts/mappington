require 'spec_helper'

describe Mappington::Path do
	subject {Mappington::Path.new :stroke_color => :blue, :stroke_weight => 5}
	it 'can have a stroke color' do
		subject.stroke_color.should eq :blue
	end
	it 'can have a stroke weight' do
		subject.stroke_weight.should eq 5
	end
	it 'should have some points' do
		subject.points << 'the Eiffel Tower'
		subject.points << [0, 0]
		subject.points.count.should eq 2
	end
	context 'Becoming a URI fragment' do
		let(:path) {Mappington::Path.new}
		it 'should raise an error if the Path has no locations' do
			expect {path.to_s}.to raise_error Mappington::PathError
		end
		it 'should raise an error if the Path only has 1 location' do
			path.points << 'the Eiffel Tower'
			expect {path.to_s}.to raise_error Mappington::PathError
		end
		it 'should become a URI fragment' do
			path.points << 'the Eiffel Tower'
			path.points << [0, 0]
			path.to_s.should eq 'path=color%3Ablack%7Cweight%3A1%7Cthe+Eiffel+Tower%7C0%2C0'
		end
	end
end