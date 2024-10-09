require_relative '../lib/data_types/linked_list/linked_list'

RSpec.describe DataTypes::LinkedList do
  let(:list) { DataTypes::LinkedList.new }

  describe '#append' do
    it 'appends elements to the end of the list' do
      list.append(1)
      list.append(2)
      list.append(3)

      expect(list.to_a).to eq([1, 2, 3])
    end

    it 'appends an element to an empty list' do
      list.append(42)
      expect(list.to_a).to eq([42])
    end
  end

  describe '#prepend' do
    it 'prepends elements to the beginning of the list' do
      list.append(2)
      list.prepend(1)

      expect(list.to_a).to eq([1, 2])
    end

    it 'prepends to an empty list' do
      list.prepend(42)
      expect(list.to_a).to eq([42])
    end
  end

  describe '#find' do
    it 'finds an element in the list' do
      list.append(10)
      node = list.find(10)

      expect(node.value).to eq(10)
    end

    it 'returns nil if element is not in the list' do
      list.append(10)
      list.append(20)

      expect(list.find(30)).to be_nil
    end
  end

  describe '#each' do
    it 'iterates over each element in the list' do
      list.append(1)
      list.append(2)
      list.append(3)

      result = []
      list.each { |value| result << value }

      expect(result).to eq([1, 2, 3])
    end
  end

  describe '#to_a' do
    it 'converts the linked list to an array' do
      list.append(5)
      list.append(10)

      expect(list.to_a).to eq([5, 10])
    end
  end

  describe '#empty?' do
    it 'returns true for an empty list' do
      expect(list.empty?).to be true
    end

    it 'returns false for a non-empty list' do
      list.append(1)
      expect(list.empty?).to be false
    end
  end

  describe '#size' do
    it 'returns the size of the list' do
      list.append(1)
      list.append(2)
      list.append(3)

      expect(list.size).to eq(3)
    end

    it 'returns 0 for an empty list' do
      expect(list.size).to eq(0)
    end
  end

  describe '#display' do
    it 'prints each element in the list' do
      list.append(1)
      list.append(2)
      list.append(3)

      expect { list.display }.to output("1\n2\n3\n").to_stdout
    end
  end
end
