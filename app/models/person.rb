class Person < ActiveRecord::Base

  after_initialize :defaults, :if => :new_record?

  def defaults
    self.gifts ||= 0
    self.quickies ||= 0
    self.smfls ||= 0
    self.opened ||= 0
  end

  def self.find_next

    gift_array = []
    Person.all.each do |person|
      person.remaining_gifts.times do
        gift_array << person
      end
    end

    gift_array.sample
  end

  def self.total_all_gifts
    people = Person.all
    gifts_set = Hash[people.collect { |person| [person.id, person.total_gifts] }]
    gifts_set.values.reduce(0,:+)
  end

  def self.total_all_opened
    people = Person.all
    gifts_set = Hash[people.collect { |person| [person.id, person.opened] }]
    gifts_set.values.reduce(0,:+)
  end

  def self.total_percent_opened
    100.0 * total_all_opened / total_all_gifts
  end

  def total_gifts
    gifts + quickies + smfls
  end

  def open_gift
    self.opened += 1
    self.save
  end

  def remaining_gifts
    return [total_gifts - opened, 0].max
  end

  def percent_opened
    100.0 * self.opened / total_gifts
  end

end
