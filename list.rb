require_relative "item"
class List
  attr_accessor :label
  def initialize(label)
    @label = label
    @items = []
  end#end init

  def add_item(title, deadline, description="")
    if Item.valid_date?(deadline)
      @items << Item.new(title, deadline, description)
      return true
    else
      false
    end#end if
  end#end add_item

  def size
    @items.length
  end#end size

  def valid_index?(index)
    if (0...@items.length).include?(index)
      true
    else
      p 'the index was not valid'
      false
    end#end if
  end#end valid index

  def swap(index_1, index_2)
    if !valid_index?(index_1) || !valid_index?(index_2)
      return false
    end#end if
    @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
  end#end swap

  def [] (index)
    valid_index?(index) ? @items[index] : nil
  end #end []

  def priority
    @items[0]
  end#end priority

  def print
    p "-"*40
    p "#{@label}".ljust(21)
    p "-"*40
    p "Index | Item | Deadline | Done"
    p "-"*40
    @items.each_with_index do |item, idx|
      idx = "#{idx} |"
      title = "#{item.title} |"
      deadline = "#{item.deadline} | "
      done = "#{item.done}"
      p idx+title+deadline+done.ljust(40)
    end
    p '-'*40
  end#end print

  def print_full_item(index)
    p '-'*20
    p @items[index].title
    p 'Deadline: '+ @items[index].deadline
    p @items[index].description
    p 'Done?' + @items[index].done.to_s
    p '-'*20
  end#print full item end

  def print_priority
    print_full_item(0)
  end#end print priority

  def up(index, amount=1)
    counter = 0
    if index!=0
      while amount > 0
        self.swap((index-counter), (index-counter-1))
        amount -=1
        counter +=1
      end#end while loop
    end#end if
  end#end up fx

  def down(index, amount=1)
    counter = 0
    if index!=@items.length-1
      while amount > 0
        self.swap((index+counter), (index+counter+1))
        amount -=1
        counter +=1
      end#end while loop
    end#end if
  end#end down fx

  def sort_by_date
    @items.sort_by!{|item| item.deadline}
  end#end sort

  def toggle_item(index)
    @items[index].toggle
  end#end toggle item

  def remove_item(index)
    if valid_index?(index)
      @items.delete_at(index)
      return true
    end#end if
    false
  end#end remove item

  def purge
    purged = false
    while !purged
      purged = true
      @items.each_with_index do |item, idx|
        if item.done == true
          @items.delete_at(idx)
          purged = false
        end#end if
      end#end each loop
    end#end while loop
  end#end purge

end#end class
#l1 = List.new('l1')
#l1.add_item('milk', '1965-1-1', 'white')
#l1.add_item('soda', '1966-1-1', 'dark')
#l1.print
#l1.toggle_item(0)
#l1.print
#l1.toggle_item(1)
#l1.print
#l1.purge
#l1.print
