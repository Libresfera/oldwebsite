require 'test_helper'

class PodcastsControllerTest < ActionController::TestCase
  setup do
    @podcast = podcasts(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:podcasts)
  end

  test 'should show podcast' do
    get :show, id: @podcast
    assert_response :success
  end
end
