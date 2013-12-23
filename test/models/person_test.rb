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

  test "Remaining gifts should be 0 if we've opened more than we have" do
    person = Person.new
    person.gifts = 10
    person.opened = 11
    assert(person.remaining_gifts == 0)
  end

end
