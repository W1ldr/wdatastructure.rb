require_relative "doubly_linked_node"

module DataTypes
  class DoublyLinkedList
    include Enumerable

    def initialize
      @head = nil
      @tail = nil
    end
  end
end
