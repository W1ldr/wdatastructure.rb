# wdatastructure

`wdatastructure` is a Ruby gem that provides a collection of data structure.
This gem is designed to demonstrate the implementation of basic data structures in Ruby.

### Linked List

- **Linked List**: A data structure that consists of a sequence of elements, where each element points to the next one.

#### Avaliable functions

- `list.append(value)`: Adds a value to the end of the list.
- `list.prepend(value)`: Inserts a value at the beginning of the list.
- `list.find(value)`: Searches for a node by its value.
- `list.each`: Iterates over each element in the list.
- `list.to_a`: Converts the linked list to an array.
- `list.empty?`: Checks if the list is empty.
- `list.size`: Returns the number of elements in the list.
- `list.display`: Prints the elements of the list to the console.

### Usage

#### Linked List

```ruby
list = DataTypes::LinkedList.new
list.append(1)
list.append(2)
list.prepend(0)
list.display # Outputs: 0, 1, 2
list.find(1) # Returns the node with value 1
list.to_a #=> [0, 1, 2]
list.size #=> 3
list.empty? #=> false
```

### How to Use

#### How to build and use as gem

1. ```bash
   gem build ./wdatastructure.gemspec
   ```
2. ```bash
    gem install 'build_name'
   ```

#### sing rubygem

1.  ```bash
    gem install wdatastructure

    ```

#### to run tests

1.  ```bash
    bundle exec rspec
    ```

## Contributing

1. Fork it ( https://github.com/W1ldr/wdatastructure.rb.git )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
