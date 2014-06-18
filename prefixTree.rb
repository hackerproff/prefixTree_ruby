#!/usr/bin/ruby
#coding: utf-8
#
#		20140609
#
#		hackerproff@gmail.com
#		hackerproff@yandex.ru
#
#		Prefix Tree
#



#
#
# getbyte(index) → 0 .. 255
# browsers.include?('Konqueror') #=> false
# arr.unshift(0) #=> [0, 1, 2, 3, 4, 5, 6]
# arr.insert(3, 'apple')  #=> [0, 1, 2, 'apple', 3, 4, 5, 6]
# "hello".start_with?("hell")
# "hello".each_byte {|c| print c, ' ' }
# "hello".each_char {|c| print c, ' ' }

 
class Tree

	####################################
	private
	
	def tail(in_word) 
			return String.new(in_word[1, (in_word.length-2)])
	end


	WORDEND = 0 
	# sign if prefix also is word
	# and simple rule; the sign is always in 0 position !

	class Record # like a structure
		attr_accessor :key
		attr_accessor :next_node

		def initialize
			@key = nil
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
		
		
		####################################
		public
		
		
		def add_word!(in_word)
			
			# check available key
			if (in_word.empty?)
				if (!(@list.include?(WORDEND)))
					@list.unshift(WORDEND)
				end
					return true
			end
			
			flag = true
			len = @list.length - 1
			search_index = len
			step = search_index / 2
			
			while flag do
				if (in_word.chr == @list[search_index].key)
					return @list[search_index].next_node.add_word!( tail(in_word) )
				else
					if (in_word.chr > @list[search_index].key)
						
						# in the end of array
						if ( search_index == len )
							@list.insert(search_index, in_word.chr)
							return @list[search_index].add_word!( tail(in_word) )
							
						end
						
					end
					
				end
			end



				if (iter.key == in_word[0])
					if (in_word.length == 1)
						iter.is_word = true
						return true
					end
					
					iter.next_node = Node.new
					return iter.next_node.add_word!(String.new(in_word[1, in_word.length-1]))  # this return recursively nested value
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
	

	####################################
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







