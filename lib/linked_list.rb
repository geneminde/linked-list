
# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node

  def initialize(value, next_node = nil)
    @data = value
    @next = next_node
  end
end

# Defines the singly linked list
class LinkedList
    def initialize
      @head = nil # keep the head private. Not accessible outside this class
    end

    # method to add a new node with the specific data value in the linked list
    # insert the new node at the beginning of the linked list
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def add_first(value)
      new_node = Node.new(value)
      new_node.next = @head
      @head = new_node
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def search(value)
      current_node = @head
      while current_node
        if current_node.data == value
          return true
        else
          current_node = current_node.next
        end
      end
      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
      return nil if @head.nil?
      current_node = @head
      max_val = current_node.data
      while current_node
        max_val = current_node.data if current_node.data > max_val
        current_node = current_node.next
      end
      return max_val
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_min
      return nil if @head.nil?
      current_node = @head
      min_val = current_node.data
      while current_node
        min_val = current_node.data if current_node.data < min_val
        current_node = current_node.next
      end
      return min_val
    end


    # Additional Exercises
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def get_first
      @head ? @head.data : nil
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def add_last(value)
      new_node = Node.new(value)
      if @head.nil?
        @head = new_node
      else
        current_node = @head
        until current_node.next.nil?
          current_node = current_node.next
        end
        current_node.next = new_node
      end
    end

    # method that returns the length of the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def length
      length = 0
      current_node = @head
      while current_node
        length += 1
        current_node = current_node.next
      end
      return length
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_at_index(index)
      return nil if index > self.length || self.length == 0
      node_index = 0
      current_node = @head
      until node_index == index
        current_node = current_node.next
        node_index += 1
      end
      return current_node.data
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def visit
      current_node = @head
      while current_node
        print current_node.data
        print ' '
        current_node = current_node.next
      end
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def delete(value)
      return nil if @head.nil?
      current_node = @head
      previous_node = nil
      if current_node.data == value
        @head = current_node.next
      else
        until current_node.data == value
          previous_node = current_node
          current_node = current_node.next
        end
        if current_node.next.nil?
          previous_node.next = nil
        else
          previous_node.next = current_node.next
        end
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def reverse
      current_node = @head
      previous_node = nil
      while current_node
        next_node = current_node.next
        current_node.next = previous_node
        previous_node = current_node
        current_node = next_node
      end
      @head = previous_node
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_last
      return nil if @head.nil?

      list_length = self.length
      return self.get_at_index(list_length - 1)

    end

    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_middle_value
      # this method will return the value of the element at the index position
      # represented by integer division of the list length by 2, regardless of
      # whether the length is odd or even i.e. the "first middle" value will be
      # returned for a list with even length.
      return nil if self.length == 0

      list_length = self.length
      return self.get_at_index(list_length/2)

    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_nth_from_end(n)
      return nil if n > self.length - 1
      total_nodes = self.length - 1
      nth_from_front = total_nodes - n
      return get_at_index(nth_from_front)
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def has_cycle?
      pointer = @head
      while pointer
        pointer = pointer.next
        return true if pointer == @head
      end
      return false
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def insert_ascending(value)
      current_node = @head
      if @head.nil? || value <= @head.data
        add_first(value)
        return
      end
      while current_node.next
        if current_node.data <= value && current_node.next.data >= value
          new_node = Node.new(value, current_node.next)
          current_node.next = new_node
          return
        else
          current_node = current_node.next
        end

      end
      add_last(value)
    end

    # Helper method for tests
    # Creates a cycle in the linked list for testing purposes
    # Assumes the linked list has at least one node
    def create_cycle
      return if @head == nil # don't do anything if the linked list is empty

      # navigate to last node
      current = @head
      while current.next != nil
          current = current.next
      end

      current.next = @head # make the last node link to first node
    end
end
