require_relative "list"
class TodoBoard
  def initialize(label)
    @label = {}
  end#end init

  def get_command
    p 'Hi or low level commands'
    level = gets.chomp
    if level == 'hi'
      p 'Enter a command: mklist, ls, showall'
      command = gets.chomp
      if command == 'mklist'
        p 'name?'
        k = gets.chomp
        @label[k] = List.new(k)

      elsif command == 'ls'
        p @label.keys

      elsif command =='showall'
        @label.each do |key, list|
          list.print
        end#end each
      end#end hi commands


    elsif level == 'low'
      p "Select a list from these choices #{@label.keys}"
      key = gets.chomp
      p 'Enter a command: mktodo, up, down, swap, sort, priority, print, toggle, purge or quit'
      command = gets.chomp
      if command == 'mktodo'
        p 'enter a title'
        title = gets.chomp
        p 'enter a deadline, year-month-day'
        deadline = gets.chomp
        p 'enter a description if you would like'
        description = gets.chomp
        @label[key].add_item(title, deadline, description)

      elsif command == 'up'
        p 'enter index'
        index = gets.chomp.to_i
        p 'enter how many spaces up to move'
        amount = gets.chomp.to_i
        @label[key].up(index, amount)

      elsif command == 'down'
        p 'enter index'
        index = gets.chomp.to_i
        p 'enter how many spaces down to move'
        amount = gets.chomp.to_i
        @label[key].down(index, amount)

      elsif command == 'swap'
        p 'enter index'
        index = gets.chomp.to_i
        p 'enter swap index'
        amount = gets.chomp.to_i
        @label[key].swap(index, amount)

      elsif command == 'sort'
        @label[key].sort_by_date

      elsif command == 'priority'
        @label[key].print_priority

      elsif command == 'print'
        p 'print whole list or index?'
        newC = gets.chomp
        if newC == 'whole list'
          @label[key].print
        else
          p 'index?'
          idx = gets.chomp
          @label[key].print_full_item(idx.to_i)
        end#end nested if

      elsif command == 'toggle'
        p 'Index?'
        idx = gets.chomp.to_i
        @label[key].toggle_item(idx)

      elsif command == 'purge'
        @label[key].purge

      elsif command == 'quit'
        return false

      else
        p'no such command, try again'
      end#end lo commands if
    end#end lo if
    true
  end#get command

  def run
    while get_command == true
      get_command
    end #end while
  end#end run

end#end class

b = TodoBoard.new('bored')
b.run
