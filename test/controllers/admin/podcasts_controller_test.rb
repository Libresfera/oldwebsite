require 'test_helper'

module Admin
  class PodcastsControllerTest < ActionController::TestCase
    setup do
      @podcast = podcasts(:one)
    end

    test 'should get index' do
      get :index
      assert_response :success
      assert_not_nil assigns(:podcasts)
    end

    test 'should get new' do
      get :new
      assert_response :success
    end

    test 'should create podcast' do
      assert_difference('Podcast.count') do
        post :create, podcast: { title: @podcast.title, description: @podcast.description,
                                 thumbnail: fixture_file_upload('/files/homer.png', 'image/png'),
                                 audio: fixture_file_upload('/files/free-software-song.mp3', 'audio/mpeg') }
      end

      assert_redirected_to admin_podcasts_path
    end

    test 'should get edit' do
      get :edit, id: @podcast
      assert_response :success
    end

    test 'should update podcast' do
      patch :update, id: @podcast, podcast: { title: @podcast.title, description: @podcast.description,
                                              thumbnail: fixture_file_upload('/files/homer.png', 'image/png'),
                                              audio: fixture_file_upload('/files/free-software-song.mp3', 'audio/mpeg') }
      assert_redirected_to admin_podcasts_path
    end

    test 'should destroy podcast' do
      assert_difference('Podcast.count', -1) do
        delete :destroy, id: @podcast
      end

      assert_redirected_to admin_podcasts_path
    end
  end
end
