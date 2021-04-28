require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as users(:first_user)
    @event = events(:first_event)
    @event_params = { title: 'Torneo iniciacio',
      subtitle: 'El mejor torneo de todos',
      description: 'Un gran torneo',
      date: '2021-05-16',
      photo: 'url'
    }
  end
  test "should get index" do
    logout
    get events_path

    assert_response :success
  end

  test "should get show" do
    logout
    get event_path(@event)

    assert_response :success
  end

  test "should get new" do
    get new_event_path

    assert_response :success
  end

  test "should get redirect in new if user is not login" do
    logout
    get new_event_path

    assert_response :redirect
  end

  test "should create an event" do
    assert_difference "Event.count", 1 do
      post events_url, params: {
        event: {
          title: 'Torneo iniciacion',
          subtitle: 'El mejor torneo de todos los torneos',
          description: 'Un gran torneo',
          date: '2021-05-16',
          photo: 'url'
        }
      }
    end
  end

  test "should get edit" do
    get edit_event_path(@event)

    assert_response :success
  end

  test "should get redirect in edit if user is not login" do
    logout
    get edit_event_path(@event)

    assert_response :redirect
  end

  test "update should be success" do
    patch event_path(@event), params: {
      event: { title: "This is the new championship" }
    }

    assert_equal "This is the new championship", Event.find(@event.id).title
  end

  test "user should be able to destroy event" do
    assert_difference "Event.count", -1 do
      delete event_path(@event)
    end
  end

  test "user should not be able to destroy event if not login" do
    logout
    assert_difference "Event.count", 0 do
      delete event_path(@event)
    end
  end
end
