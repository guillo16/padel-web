require 'test_helper'

class EventTest < ActiveSupport::TestCase
  setup do
    @event = Event.new(date: '2021-05-16',
                       description: 'Un gran torneo',
                       subtitle: 'El mejor torneo de todos',
                       photo: 'url',
                       title: 'Torneo iniciacion'
                      )
  end

  test "should be valid if all fields are set" do
    assert @event.valid?
  end

  test "should be invalid if date is not set" do
    @event.date = nil

    assert_not @event.valid?
  end

  test "should be invalid if description is not set" do
    @event.description = nil

    assert_not @event.valid?
  end

  test "should be invalid if subtitle is not set" do
    @event.subtitle = nil

    assert_not @event.valid?
  end

  test "should be invalid if photo is not set" do
    @event.photo = nil

    assert_not @event.valid?
  end

  test "should be invalid if title is not set" do
    @event.title = nil

    assert_not @event.valid?
  end
end
