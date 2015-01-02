require 'test_helper'

class PodcastsControllerTest < ActionController::TestCase
  setup do
    @podcast = podcasts(:one)
  end

  test 'expect get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:podcasts)
  end

  test 'expect get new' do
    get :new
    assert_response :success
  end

  test 'expect create podcast' do
    assert_difference('Podcast.count') do
      post :create, podcast: { audio: @podcast.audio, description: @podcast.description, thumbnail: @podcast.thumbnail,
                               title: @podcast.title }
    end

    assert_redirected_to podcast_path(assigns(:podcast))
  end

  test 'expect show podcast' do
    get :show, id: @podcast
    assert_response :success
  end

  test 'expect get edit' do
    get :edit, id: @podcast
    assert_response :success
  end

  test 'expect update podcast' do
    patch :update, id: @podcast, podcast: { audio: @podcast.audio, description: @podcast.description,
                                            thumbnail: @podcast.thumbnail, title: @podcast.title }
    assert_redirected_to podcast_path(assigns(:podcast))
  end

  test 'expect destroy podcast' do
    assert_difference('Podcast.count', -1) do
      delete :destroy, id: @podcast
    end

    assert_redirected_to podcasts_path
  end
end
