require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
	should have_many(:photos)
	should validate_presence_of :name
	should validate_presence_of :description
end
