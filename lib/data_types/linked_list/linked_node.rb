require_relative "../node"

module DataTypes
  class SinglyLinkedNode < NodeBase
    attr_accessor :next

    def initialize(value)
      super(value)
      @next = nil
    end
  end
end
