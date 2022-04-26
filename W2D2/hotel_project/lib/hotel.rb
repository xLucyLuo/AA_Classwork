require_relative "room"

class Hotel
  def initialize(name, rooms)
    @name = name
    @rooms = {}
    rooms.each{|name, capacity| @rooms[name] = Room.new(capacity)}
  end

  def name
    @name.split(" ").map{|word| word.capitalize}.join(" ")
  end

  attr_reader :rooms

  def room_exists?(name)
    rooms.include?(name)
  end

  def check_in(person, room)
    if !room_exists?(room)
        p "sorry, room does not exist"
    elsif @rooms[room].add_occupant(person)
        p 'successful'
    else
        p "sorry, room is full"
    end
  end

  def has_vacancy?
    @rooms.each_value.any?{|room| !room.full?}
  end

  def list_rooms
    @rooms.each{|name,room| p name + ".*" + room.available_space.to_s}
  end
end
