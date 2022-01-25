class Item

  def self.valid_date?(date_string)
    parts = date_string.split("-").map(&:to_i)
    return false if parts[0].length != 4
    return false if !(1..12).include?(parts[1])
    return false if !(1..31).include?(parts[2])
    true
  end#end valid date?

  attr_accessor :title, :description
  attr_reader :deadline

  def initialize(title, deadline, description)
    raise 'deadline is not valid' if !Item.valid_date?(deadline)
    @title = title
    @deadline = deadline
    @description = description
    @done = false
  end#end init

  def deadline= (new_deadline)
    raise 'deadline is not valid' if !Item.valid_date(new_deadline)
    @deadline = new_deadline
  end#end deadline=

  def toggle
    @done = !@done
  end#end toggle

end#end class

i1 = Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')
