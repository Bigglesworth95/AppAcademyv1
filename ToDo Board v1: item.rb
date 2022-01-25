class Item
  attr_accessor :title, :description
  attr_reader :deadline
  def self.valid_date?(date_string)
    parts = date_string.split("-")
    return false if parts[0].length != 4
    return false if !(1..12).include?(parts[1].to_i)
    return false if !(1..31).include?(parts[2].to_i)
    true
  end#end valid date?

  def initialize(title, deadline, description)
    @title = title
    @description = description
    if Item.valid_date?(deadline)
      @deadline = deadline
    else
      raise 'invalid date'
    end#end if
    @done = false
  end#end init

  def deadline= (new_deadline)
    if Item.valid_date?(new_deadline)
      @deadline = new_deadline
    else
      raise 'invalid date'
    end#end if
  end#end deadline=

  def toggle
    if @done == false
      @done = true
    else
      @done = false
    end
  end#end toggle

end#end class

i1 = Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')
