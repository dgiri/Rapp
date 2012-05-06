require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
	#should validate_presence_of :name
	#should validate_presence_of :description
	should have_many(:photos)
end
