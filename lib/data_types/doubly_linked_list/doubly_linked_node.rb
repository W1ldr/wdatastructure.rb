require_relative "../node"

module DataTypes
  class DoublyLinkedNode < NodeBase
    attr_accessor :next, :previous

    def initialize(value)
      super(value)
      @next = nil
      @previous = nil
    end
  end
end
