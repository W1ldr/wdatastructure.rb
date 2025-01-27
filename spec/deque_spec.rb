require_relative '../lib/data_types/queue/deque'

RSpec.describe DataTypes::Deque do
  let(:deque) { DataTypes::Deque.new }

  describe '#push_back' do
    it 'adds elements to the back of the deque' do
      deque.push_back(1)
      deque.push_back(2)
      deque.push_back(3)
      expect(deque.to_a).to eq([1, 2, 3])
    end

    it 'adds an element to an empty deque' do
      deque.push_back(42)
      expect(deque.to_a).to eq([42])
    end
  end

  describe '#push_front' do
    it 'adds elements to the front of the deque' do
      deque.push_back(2)
      deque.push_front(1)
      expect(deque.to_a).to eq([1, 2])
    end

    it 'adds an element to an empty deque' do
      deque.push_front(42)
      expect(deque.to_a).to eq([42])
    end
  end

  describe '#pop_front' do
    it 'removes and returns the element from the front' do
      deque.push_back(1)
      deque.push_back(2)
      deque.push_back(3)
      expect(deque.pop_front).to eq(1)
      expect(deque.to_a).to eq([2, 3])
    end

    it 'returns nil when the deque is empty' do
      expect(deque.pop_front).to be_nil
    end
  end

  describe '#pop_back' do
    it 'removes and returns the element from the back' do
      deque.push_back(1)
      deque.push_back(2)
      deque.push_back(3)
      expect(deque.pop_back).to eq(3)
      expect(deque.to_a).to eq([1, 2])
    end

    it 'returns nil when the deque is empty' do
      expect(deque.pop_back).to be_nil
    end
  end

  describe '#peek_front' do
    it 'returns the element at the front without removing it' do
      deque.push_back(1)
      deque.push_back(2)
      expect(deque.peek_front).to eq(1)
      expect(deque.to_a).to eq([1, 2])
    end

    it 'returns nil when the deque is empty' do
      expect(deque.peek_front).to be_nil
    end
  end

  describe '#peek_back' do
    it 'returns the element at the back without removing it' do
      deque.push_back(1)
      deque.push_back(2)
      expect(deque.peek_back).to eq(2)
      expect(deque.to_a).to eq([1, 2])
    end

    it 'returns nil when the deque is empty' do
      expect(deque.peek_back).to be_nil
    end
  end

  describe '#empty?' do
    it 'returns true for an empty deque' do
      expect(deque.empty?).to be true
    end

    it 'returns false for a non-empty deque' do
      deque.push_back(1)
      expect(deque.empty?).to be false
    end
  end

  describe '#size' do
    it 'returns the size of the deque' do
      expect(deque.size).to eq(0)
      deque.push_back(1)
      deque.push_back(2)
      expect(deque.size).to eq(2)
    end
  end

  describe '#each' do
    it 'iterates over each element in the deque' do
      deque.push_back(1)
      deque.push_back(2)
      deque.push_back(3)

      result = []
      deque.each { |value| result << value }
      expect(result).to eq([1, 2, 3])
    end
  end

  describe '#display' do
    it 'prints each element in the deque' do
      deque.push_back(1)
      deque.push_back(2)
      deque.push_back(3)
      expect { deque.display }.to output("1\n2\n3\n").to_stdout
    end
  end

  describe '#to_a' do
    it 'returns an array representation of the deque values' do
      deque.push_back(5)
      deque.push_back(10)
      expect(deque.to_a).to eq([5, 10])
    end
  end
end