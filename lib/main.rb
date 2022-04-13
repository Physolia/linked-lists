# frozen_string_literal: true

require 'pry'
require_relative 'linked_list'

nomi_list = LinkedList.new

nomi_list.append("b")
nomi_list.append("c")
nomi_list.append("d")
nomi_list.append("e")
nomi_list.append("f")
nomi_list.prepend("a")
nomi_list.insert_at("3", 3)
nomi_list.insert_at("6", 6)
puts nomi_list.contains?("c")
puts nomi_list.contains?("cd")
puts nomi_list.find("c")
puts nomi_list.find("cd")
puts nomi_list.to_s
nomi_list.remove_at(3)
puts nomi_list.to_s