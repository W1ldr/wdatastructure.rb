module DataTypes
  class PriorityQueue
    include Enumerable

    def initialize
      @data = []
    end

    # Enqueues an element with an associated priority.
    # Lower priority values indicate higher priority.
    def enqueue(value, priority)
      @data << { value: value, priority: priority }
      @data.sort_by! { |item| item[:priority] }
    end

    # Dequeues the element with the highest priority.
    def dequeue
      item = @data.shift
      item ? item[:value] : nil
    end

    # Returns the element with the highest priority without removing it.
    def peek
      @data.first ? @data.first[:value] : nil
    end

    def empty?
      @data.empty?
    end

    def size
      @data.size
    end

    # Iterates over the stored values in order of priority.
    def each(&block)
      @data.each { |item| block.call(item[:value]) }
    end

    # Displays each element in the queue.
    def display
      each { |value| puts value }
    end

    # Returns an array representation of the values in the queue.
    def to_a
      map { |value| value }
    end
  end
end