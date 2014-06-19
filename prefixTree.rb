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
			
			# check word end sign
			if (in_word.empty?)
				if (!(@list.include?(WORDEND)))
					@list.unshift(WORDEND)
				end
					return true
			end
			
			len = @list.length - 1
			search_index = len
			step = search_index / 2
			
			# check available key
			while true do
				if (in_word.chr == @list[search_index].key)
					return @list[search_index].next_node.add_word!(tail(in_word))
				else
					if (in_word.chr > @list[search_index].key)
						
						if (search_index == len) # in the end of array
							@list.insert(search_index, Node.new())
							@list[search_index].key = in_word.chr
							return @list[search_index].next_node.add_word!(tail(in_word))
						end # if char > key; and in the end of array
						
						if (in_word.chr < @list.[search_index + 1].key) # if next value is bigger
							@list.insert(search_index, Node.new())
							@list[search_index+1].key = in_word.chr
							return @list[searhc_index+1].next_node.add_word!(tail(in_word))
						else
							search_index += step
							step /= 2
							next
						end
					end # if char > key
					
					if (in_word.chr < @list.[search_index].key)
						if (search_index == 0)
						
						end
						
						if (in_word.chr > @list.[search_index-1].key)
						
						end
					end # if char < key
				end # if char == key
			end # while flag do
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







