module DataTypes
  class Stack
    include Enumerable

    def initialize
      @data = []
    end

    def push(value)
      @data.push(value)
    end

    def pop
      @data.pop
    end

    def peek
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