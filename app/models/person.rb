class Person < ActiveRecord::Base

  after_initialize :defaults, :if => :new_record?

  def defaults
    self.gifts ||= 0
    self.quickies ||= 0
    self.smfls ||= 0
  end

  def self.find_next

  end

  def self.total_all_gifts
    people = Person.all
    gifts_set = Hash[people.collect { |person| [person.id, person.total_gifts] }]
    gifts_set.values.reduce(0,:+)
  end

  def total_gifts
    gifts + quickies + smfls
  end


end
