require 'test_helper'

class PlayerMatchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get player_matches_index_url
    assert_response :success
  end

end
