module DataTypes
  class Queue
    include Enumerable

    def initialize
      @data = []
    end

    def enqueue(value)
      @data.push(value)
    end

    def dequeue
      @data.shift
    end

    def peek
      @data.first
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