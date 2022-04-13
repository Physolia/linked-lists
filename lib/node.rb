# frozen_string_literal: true

# A class to create and manage individual nodes
class Node
  attr_accessor :data, :next_node

  def initialize(data = nil, next_node = nil)
    @data = data
    @next_node = next_node
  end

  def to_s
    puts @data
    # Puts "#{@data}, next_node: #{@next_node}"
  end
end
