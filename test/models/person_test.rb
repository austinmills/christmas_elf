require 'test_helper'

class PersonTest < ActiveSupport::TestCase

  test "total should be equal to 0 when no gifts added" do
    person = Person.new
    assert(person.total_gifts == 0)
  end

  test "total should be equal to sum of all gift types" do
    person = Person.new
    person.gifts = 10
    person.quickies = 5
    person.smfls = 1
    assert(person.total_gifts == 16)
  end

end
