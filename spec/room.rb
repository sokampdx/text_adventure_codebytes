require 'spec_helper'

describe Room do
	let(:empty_room) { Room.new }
	let(:stuff_room) { Room.new( { size: 4, interaction: { door: [3,3] } } ) }
	context '.interaction' do
		it { expect(empty_room.interaction).to be_nil }
	end

	context '.can_move_to?' do
		it { expect(empty_room.can_move_to?(0, 0)).to be_truthy }	
	end

	context '.entrance' do
		it { expect(empty_room.entrance).to match_array([0, 0]) }
	end

	context '.interact?' do
		it 'return true if object is preset' do
			expect(stuff_room.interact?('door')).to be_truthy
		end

		it 'return false if object not there' do
			expect(empty_room.interact?('door')).to be_falsey
		end
	end
end
