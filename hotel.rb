require_relative "room"

class Hotel
  def initialize(name, hash)
    @name = name
    @rooms = {}
    hash.each do |k, v|
      @rooms[k] = Room.new(v)
    end
  end

  def name
    @name.split(" ").map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(name)
    @rooms.has_key?(name)
  end

  def check_in(person, room)
    if self.room_exists?(room)
      if @rooms[room].add_occupant(person)
        puts 'check in successful'
      else
        puts 'sorry, room is full'
      end
    else
      puts 'sorry, room does not exist'
    end
  end

  def has_vacancy?
    @rooms.values.any? {|room| room.available_space > 0}
  end

  def list_rooms
    @rooms.each do |room, capacity|
      puts "#{room}. #{@rooms[room].available_space}"
    end
  end
end

h = Hotel.new('Inn', 'attic' => 3)
puts h.check_in('harold', 'attic')
puts h.rooms['attic'].occupants
