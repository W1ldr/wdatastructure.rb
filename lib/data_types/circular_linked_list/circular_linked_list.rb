require_relative "../doubly_linked_list/doubly_linked_node"

module DataTypes
  class CircularLinkedList
    include Enumerable
    attr_reader :head, :tail

    def initialize
      @head = nil
      @tail = nil
    end

    def append(value)
      new_node = DoublyLinkedNode.new(value)
      if @head.nil?
        @head = new_node
        @tail = new_node
        new_node.next = new_node
        new_node.previous = new_node
      else
        new_node.previous = @tail
        new_node.next = @head
        @tail.next = new_node
        @head.previous = new_node
        @tail = new_node
      end
    end

    def prepend(value)
      new_node = DoublyLinkedNode.new(value)
      if @head.nil?
        @head = new_node
        @tail = new_node
        new_node.next = new_node
        new_node.previous = new_node
      else
        new_node.next = @head
        new_node.previous = @tail
        @head.previous = new_node
        @tail.next = new_node
        @head = new_node
      end
      new_node
    end

    def find(value)
      return nil if @head.nil?
      current = @head
      loop do
        return current if current.value == value
        current = current.next
        break if current == @head
      end
      nil
    end

    def to_a
      arr = []
      return arr if @head.nil?
      current = @head
      loop do
        arr << current.value
        current = current.next
        break if current == @head
      end
      arr
    end

    def empty?
      @head.nil?
    end

    def size
      count = 0
      return count if @head.nil?
      current = @head
      loop do
        count += 1
        current = current.next
        break if current == @head
      end
      count
    end

    def each
      return enum_for(:each) unless block_given?
      return if @head.nil?
      current = @head
      loop do
        yield current.value
        current = current.next
        break if current == @head
      end
    end

    def display
      each { |value| puts value }
    end
  end
end