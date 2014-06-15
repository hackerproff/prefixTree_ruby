#!/usr/bin/ruby
#coding: utf-8
#
#		20140609
#
#		hackerproff@gmail.com
#		hackerproff@yandex.ru
#
#		Prefix Tree
# 2


class Tree

private
	
	
	
	class Record # like a structure
		attr_accessor :key
		attr_accessor :is_word
		attr_accessor :next_node
		
		def initialize
			@key = String.new("")
			@is_word = false
			@next_node = nil
			return self
		end
	end # class Record
	
	
	class Node
		attr_reader :list
		
		def initialize
			@list = Array.new(Record)
			return self
		end 
		
	public
		def add_word!(in_word)
			# check available key
			print String.new("class node; add word:" + in_word) # debug
			for iter in @list do
				
				if (iter.key == in_word[0])
					if (in_word.length == 1)
						iter.is_word = true
						return true
					end
					
					iter.next_node = Node.new
					return iter.next_node.add_word!(String.new(in_word[1, in_word.length-1]))  # this return recursively nested value
				end
			end
			
			# if key not available; make new rec for key
			@list<< Record.new
			@list[@list.length-1].key = in_word[0]
			if (in_word.length == 1)
				@list[@list.length-1].is_word = true
				return true
			else
				@list[@list.length-1].next_node = Node.new
				return @list[@list.length-1].next_node.add_word!(String.new(in_word[1, in_word.length-1]))
			end
		end # add_word!
		
		
	end # class Node


	def initialize
		@root = Node.new
		return self
	end
	


public

	def is_word?(in_word)
		return ( (in_word.respond_to? String) && (!(in_string.empty?)))
	end
	
	def add_word!(in_word)
		if (is_word?(in_word))
			return @root.add_word!
		else
			return false
		end
	end
	
	def get_words(in_prefix)
		if (is_word?(in_word))
			return @root.
		else
			return nil
		end
	end	# get_words
	
end # class Tree