require 'spec_helper'

describe Mappington::PointList do
	it 'should become a URI fragment' do
		point_list = Mappington::PointList.new
		point_list << 'the Eiffel Tower'
		point_list << [0, 0]
		point_list.to_s.should eq 'the Eiffel Tower|0,0'
	end
end