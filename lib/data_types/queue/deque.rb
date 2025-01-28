module DataTypes
  class Deque
    include Enumerable

    def initialize
      @data = []
    end

    def push_back(value)
      @data.push(value)
    end

    def push_front(value)
      @data.unshift(value)
    end

    def pop_front
      @data.shift
    end

    def pop_back
      @data.pop
    end

    def peek_front
      @data.first
    end

    def peek_back
      @data.last
    end

    def empty?
      @data.empty?
    end

    def size
      @data.size
    end

    def each(&block)
      @data.each(&block)
    end

    def display
      each { |value| puts value }
    end

    def to_a
      @data.dup
    end
  end
end