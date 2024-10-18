module DataTypes
  class NodeBase
    attr_accessor :value

    def initialize(value)
      @value = value
    end
  end
end