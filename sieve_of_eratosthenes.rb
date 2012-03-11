def find_primes( limit )
	list = Hash.new
	(2..limit).each do |i|
		list[ i ] = true		
	end
	init = 2
	while init <= limit/2 do
		if list[init] then 
			index = init * 2
			while index <= limit do				
				list[ index ] = false				
				index += init		
			end
		end
		init += 1
	end	
	print_primes list
end

def print_primes( list )
	list.each do |i , value| 
		if value then
			puts "#{i}"
		end
	end
end

find_primes( 30 )
