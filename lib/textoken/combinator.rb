module Textoken
  # Combinator takes array of arrays & combines them
  # and returns intersecting values through intersections method
  class Combinator
    attr_reader :objects

    def initialize(objects)
      @i        = objects.first
      @objects  = objects
    end

    def intersection
      objects.each { |t| @i &= t }
      @i
    end
  end
end
