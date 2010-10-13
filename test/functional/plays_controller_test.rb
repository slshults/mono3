require 'test_helper'
require 'spec/matchers'

class PlaysControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plays)
  end

  test "should create play" do
    PlaysController.any_instance.stubs(:logged_in?).returns(true)
    assert_difference('Play.count') do
      post :create, :play => {:title => 'One night in Burbank', :author_id => 1, :classification => 'Comedy' }
    end
    assert_redirected_to play_path(assigns(:play))
  end

  test "should show play" do
    get :show, :id => plays(:hamlet).to_param
    assert_response :success
  end

  test "should update play" do
    PlaysController.any_instance.stubs(:logged_in?).returns(true)
    put :update, :id => plays(:hamlet).to_param, :play => { }
    assert_redirected_to play_path(assigns(:play))
  end

  test "should destroy play" do
    PlaysController.any_instance.stubs(:logged_in?).returns(true)
    assert_difference('Play.count', -1) do
      delete :destroy, :id => plays(:hamlet).to_param
    end

    assert_redirected_to plays_path
  end

  test "should show monologues by play" do
    hamlet = Play.find_by_title('Hamlet')

    get :show, :id => hamlet.id
    assert @response.body.include? 'Hamlet'
    assert @response.body.include? 'To be, or not to be'
    assert @response.body.include? 'O what a noble mind'
  end

# FAILS: problem when GENDER constant uses test ids
# #  test "should show monologues by play and men" do
#    men = Gender.find_by_name('Men')
#    hamlet = Play.find_by_title('Hamlet')
#
#    get :show, :id => hamlet.id, :g => men.id
#    assert @response.body.include? 'Hamlet'
#    assert @response.body.include? 'To be, or not to be'
#    assert_nil @response.body.match( /O what a noble mind/ )
#  end
#
#  test "should show women but not men monologues for /women/hamlet" do
#    women = Gender.find_by_name('Women')
#    hamlet = Play.find_by_title('Hamlet')
#
#    get :show, :id => hamlet.id, :g => women.id
#    assert @response.body.include? 'Hamlet'
#    assert @response.body.include? 'O what a noble mind'
#    assert_nil @response.body.match( /To be, or not to be/ )
#  end

##   Failing !?!
#  test "should show gender=both monologues for /women/hamlet" do
#    women = Gender.find_by_name('Women')
#    hamlet = Play.find_by_title('Hamlet')
#
#    get :show, :id => hamlet.id, :g => women.id
#    assert @response.body.include? 'Puck'
#  end

end
