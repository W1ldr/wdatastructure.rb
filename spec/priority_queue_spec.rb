require_relative '../lib/data_types/queue/priority_queue'

RSpec.describe DataTypes::PriorityQueue do
  let(:pq) { DataTypes::PriorityQueue.new }

  describe '#enqueue' do
    it 'enqueues elements with priorities and sorts them accordingly' do
      pq.enqueue("low", 10)
      pq.enqueue("medium", 5)
      pq.enqueue("high", 1)
      
      expect(pq.to_a).to eq(["high", "medium", "low"])
    end

    it 'enqueues an element into an empty queue with default priority' do
      pq.enqueue("only")
      expect(pq.to_a).to eq(["only"])
      # Default priority 100 should be applied if not specified.
      expect(pq.peek).to eq("only")
    end

    it 'raises an error when a non-numeric priority is passed' do
      expect { pq.enqueue("bad", "high") }.to raise_error(ArgumentError, "Priority must be a numeric value")
    end
  end

  describe '#dequeue' do
    it 'dequeues elements based on highest priority (lowest priority value)' do
      pq.enqueue("low", 10)
      pq.enqueue("high", 1)
      pq.enqueue("medium", 5)

      expect(pq.dequeue).to eq("high")
      expect(pq.to_a).to eq(["medium", "low"])
    end

    it 'returns nil when the queue is empty' do
      expect(pq.dequeue).to be_nil
    end
  end

  describe '#peek' do
    it 'returns the element with the highest priority without removing it' do
      pq.enqueue("high", 1)
      pq.enqueue("low", 10)

      expect(pq.peek).to eq("high")
      expect(pq.to_a).to eq(["high", "low"])
    end

    it 'returns nil when the queue is empty' do
      expect(pq.peek).to be_nil
    end
  end

  describe '#empty?' do
    it 'returns true for an empty queue' do
      expect(pq.empty?).to be true
    end

    it 'returns false for a non-empty queue' do
      pq.enqueue("test", 1)
      expect(pq.empty?).to be false
    end
  end

  describe '#size' do
    it 'returns the size of the queue' do
      expect(pq.size).to eq(0)
      pq.enqueue("a", 1)
      pq.enqueue("b", 2)
      expect(pq.size).to eq(2)
    end
  end

  describe '#display' do
    it 'prints each element in order of priority' do
      pq.enqueue("first", 2)
      pq.enqueue("priority", 1)
      expect { pq.display }.to output("priority\nfirst\n").to_stdout
    end
  end

  describe '#to_a' do
    it 'returns an array representation of the queue values in order' do
      pq.enqueue("one", 3)
      pq.enqueue("two", 1)
      expect(pq.to_a).to eq(["two", "one"])
    end
  end
end