# ruby
require_relative '../lib/data_types/queue/queue'

RSpec.describe DataTypes::Queue do
  let(:queue) { DataTypes::Queue.new }

  describe '#enqueue' do
    it 'enqueues elements to the end of the queue' do
      queue.enqueue(1)
      queue.enqueue(2)
      queue.enqueue(3)
      expect(queue.to_a).to eq([1, 2, 3])
    end

    it 'enqueues an element onto an empty queue' do
      queue.enqueue(42)
      expect(queue.to_a).to eq([42])
    end
  end

  describe '#dequeue' do
    it 'dequeues elements from the front in FIFO order' do
      queue.enqueue(1)
      queue.enqueue(2)
      queue.enqueue(3)

      expect(queue.dequeue).to eq(1)
      expect(queue.to_a).to eq([2, 3])
      expect(queue.dequeue).to eq(2)
      expect(queue.dequeue).to eq(3)
      expect(queue.dequeue).to be_nil
    end
  end

  describe '#peek' do
    it 'returns the front element without removing it' do
      queue.enqueue(1)
      queue.enqueue(2)
      expect(queue.peek).to eq(1)
      expect(queue.to_a).to eq([1, 2])
    end

    it 'returns nil when the queue is empty' do
      expect(queue.peek).to be_nil
    end
  end

  describe '#empty?' do
    it 'returns true for an empty queue' do
      expect(queue.empty?).to be true
    end

    it 'returns false for a non-empty queue' do
      queue.enqueue(1)
      expect(queue.empty?).to be false
    end
  end

  describe '#size' do
    it 'returns the size of the queue' do
      expect(queue.size).to eq(0)
      queue.enqueue(1)
      queue.enqueue(2)
      expect(queue.size).to eq(2)
    end
  end

  describe '#display' do
    it 'prints each element in the queue' do
      queue.enqueue(1)
      queue.enqueue(2)
      queue.enqueue(3)
      expect { queue.display }.to output("1\n2\n3\n").to_stdout
    end
  end
end