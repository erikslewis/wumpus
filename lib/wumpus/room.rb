warn "The Wumpus::Room class has not yet been implemented"

module Wumpus
  class Room
    def initialize(number)
      @number = number
      @neighbors = []
      @hazards = []
    end

attr_accessor :hazards, :neighbors, :number

 def add(thing)
   @hazards.push(thing)

 end

 def remove(thing)
   @hazards.delete(thing)
 end

 def has?(thing)
   @hazards.include?(thing)
 end

 def empty?
   @hazards.empty?
 end

 def safe?
   room_not_safe = @hazards.any?
       @neighbors.each do |the_neighbor|
         if the_neighbor.hazards.any?
           room_not_safe = true
         end
       end
      !room_not_safe
    end

 def connect(other_room)
   @neighbors.push(other_room)
      other_room.neighbors.push self
 end

 def exits
   neighbors.map { |e| e.number }
 end

 def neighbor(number)
   neighbors.find { |e| e.number == number }
 end

  def random_neighbor
   neighbors.sample
  end
 end
 end
