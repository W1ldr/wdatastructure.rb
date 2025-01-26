module DataTypes
  class PriorityQueue
    include Enumerable

    def initialize
      @data = []
    end

    # Enqueues an element with an associated priority.
    # Lower priority values indicate higher priority.
    # If no priority is provided, a default value (100) is used.
    # Raises an error if the provided priority is not Numeric.
    def enqueue(value, priority = 100)
      unless priority.is_a?(Numeric)
        raise ArgumentError, "Priority must be a numeric value"
      end

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