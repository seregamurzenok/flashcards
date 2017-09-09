require 'test_helper'

class CardTest < ActiveSupport::TestCase
  test "index" do
    get :index 
    assert_template "index"
  end 
end
