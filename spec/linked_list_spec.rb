# spec/linked_list_spec.rb
require_relative '../lib/data_types/linked_list/linked_list'

RSpec.describe DataTypes::LinkedList do
  it 'appends elements to the list' do
    list = DataTypes::LinkedList.new
    list.append(1)
    list.append(2)
    list.append(3)

    expect(list.to_a).to eq([1, 2, 3])
  end

  it 'finds an element in the list' do
    list = DataTypes::LinkedList.new
    list.append(10)
    node = list.find(10)

    expect(node.value).to eq(10)
  end
end
