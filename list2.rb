require_relative "item"
class List
  #print styles
  LINE_WITH = 49
  INDEX_COL_WIDTH = 5
  ITEM_COL_WIDTH = 20
  DEADLINE_COL_WIDTH = 10
  CHECKMARK = "\u2713".force_encoding('utf-8') #pretty checkmark

  attr_accessor :label

  def initialize(label)
    @label = label
    @items = []
  end#end init

  def add_item(title, deadline, description="")
    return false if !Item.valid_date?(deadline)
    @items << Item.new(title, deadline, description)
    true
  end#end add_item

  def toggle_item(index)
    @items[index].toggle
  end#end toggle item

  def size
    @items.length
  end#end size

  def valid_index?(index)
    0 <= index && index < self.size
  end#end valid index

  def swap(index_1, index_2)
    return false if !valid_index?(index_1) || !valid_index?(index_2)
    @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
    true
  end#end swap

  def [] (index)
    valid_index?(index) ? @items[index] : nil
  end #end []

  def print
    puts "_"*LINE_WIDTH
    puts " "*16 +self.label.upcase
    puts "-"*LINE_WIDTH
    puts "#{'Index'.ljust(INDEX_COL_WIDTH)} | #{'Item'.ljust(ITEM_COL_WIDTH)} | #{'Deadline'.ljust(DEADLINE_COL_WIDTH)} | Done"
    puts "-"*LINE_WIDTH
    @items.each_with_index do |item, i|
      status = item.done ? CHECKMARK : ' '
      puts "#{i.to_s.ljust(INDEX_COL_WIDTH)} | #{item.title.ljust(ITEM_COL_WIDTH)} | #{item.deadline.ljust(DEADLINE_COL_WIDTH)} | [#{status}]"
    end
    puts "-"*LINE_WIDTH
  end

  def priority
    @items[0]
  end#end priority


  def print_full_item(index)
    item = self[index]
    return if item.nil?
    status = item.done ? CHECKMARK : " "
    puts "-"*LINE_WIDTH
    puts "#{item.title}".ljust(LINE_WIDTH/2) + "#{item.deadline} [#{status}]".rjust(LINE_WIDTH/2)
    puts item.description
    puts '-'*LINE_WIDTH
  end#print full item end

  def print_priority
    print_full_item(0)
  end#end print priority

  def up(index, amount=1)
    return false if !valid_index?(index)
    while amount > 0 && index !=0
      swap(index, index-1)
      index -=1
      amount -=1
    end
    true
  end#end up fx

  def down(index, amount=1)
    return false if !valid_index?(index)
    while amount > 0 && index != size-1
      swap(index, index +1)
      index +=1
      amount -=1
    end
    true
  end#end down fx

  def sort_by_date
    @items.sort_by!{|item| item.deadline}
  end#end sort

  def remove_item(index)
    return false if !valid_index?(index)
    @items.delete_at(index)
    true
  end#end remove item

  def purge
    @items.delete_if(&:done)
  end#end purge

end#end class
