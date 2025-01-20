require_relative '../lib/data_types/stack/stack'

RSpec.describe DataTypes::Stack do
  let(:stack) { DataTypes::Stack.new }

  describe '#push' do
    it 'pushes elements onto the stack' do
      stack.push(1)
      stack.push(2)
      stack.push(3)

      expect(stack.to_a).to eq([1, 2, 3])
    end

    it 'pushes an element onto an empty stack' do
      stack.push(42)
      expect(stack.to_a).to eq([42])
    end
  end

  describe '#pop' do
    it 'pops elements off the stack in LIFO order' do
      stack.push(1)
      stack.push(2)
      stack.push(3)

      expect(stack.pop).to eq(3)
      expect(stack.to_a).to eq([1, 2])
      expect(stack.pop).to eq(2)
      expect(stack.pop).to eq(1)
      expect(stack.pop).to be_nil
    end
  end

  describe '#peek' do
    it 'returns the top element without removing it' do
      stack.push(1)
      stack.push(2)

      expect(stack.peek).to eq(2)
      expect(stack.to_a).to eq([1, 2])
    end

    it 'returns nil when the stack is empty' do
      expect(stack.peek).to be_nil
    end
  end

  describe '#empty?' do
    it 'returns true for an empty stack' do
      expect(stack.empty?).to be true
    end

    it 'returns false for a non-empty stack' do
      stack.push(1)
      expect(stack.empty?).to be false
    end
  end

  describe '#size' do
    it 'returns the size of the stack' do
      expect(stack.size).to eq(0)
      stack.push(1)
      stack.push(2)
      expect(stack.size).to eq(2)
    end
  end

  describe '#display' do
    it 'prints each element in the stack' do
      stack.push(1)
      stack.push(2)
      stack.push(3)

      expect { stack.display }.to output("1\n2\n3\n").to_stdout
    end
  end
end