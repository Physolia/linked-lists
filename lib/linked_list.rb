# frozen_string_literal: true

# require 'pry'

require_relative 'node'

# A class to create & manage a linked list object
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    if @tail == nil
      @tail = Node.new(value)
    else
      new_tail = Node.new(value)
      @tail.next_node = new_tail
      @tail = new_tail
    end
    if @head == nil
      @head = @tail
    end
  end

  def prepend(value)
    if @head == nil
      @head = Node.new(value)
    else
      @head = Node.new(value, @head)
    end
    if @tail == nil
      @tail = @head
    end
  end

  def size
    return 0 if @head == nil
    count = 0
    current_node = @head
    until current_node == nil
      current_node = current_node.next_node
      count += 1
    end
    return count
  end

  def at(index)
    return "Error" if index > self.size
    count = 1
    current_node = @head
    until count == index
      current_node = current_node.next_node
      count += 1
    end
    return current_node
  end

  def pop
    return "Error" if @tail == nil
    @tail = self.at(self.size-1)
    @tail.next_node = nil
  end

  def contains?(value)
    current_node = @head
    contains = false
    until current_node.nil?
      contains = true if current_node.data == value
      current_node = current_node.next_node
    end
    contains
  end

  def find(value)
    current_node = @head
    index = 0
    found = false
    until current_node.nil?
      found = true if current_node.data == value
      current_node = current_node.next_node
      index += 1 unless found
    end
    index if found
  end

  def to_s
    current_node = @head
    until current_node.nil?
      print "( #{current_node.data} ) -> "
      current_node = current_node.next_node
    end
    print 'nil'
  end

  def insert_at(value, index)
    return "Error" if index > self.size
    if index == 1
      self.prepend(value)
    elsif index == self.size
      self.append(value)
    else
      before_node = self.at(index-1)
      after_node = self.at(index)
      before_node.next_node = Node.new(value, after_node)
    end
  end

  def remove_at(index)
    return "Error" if index > self.size
    if index == self.size
      self.pop
    elsif index == 1
      @head = @head.next_node
    else
      before_node = self.at(index-1)
      after_node = self.at(index+1)
      before_node.next_node = after_node
    end
  end
end