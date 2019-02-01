defmodule MyList do
	
	def max_nr(list), do: max_nr(list, 0) # initial value

	def max_nr([], value), do: value

	def max_nr([head|tail], value) when value > head do
		max_nr(tail, value)
	end

	def max_nr([head|tail], value) when value < head do
		max_nr(tail, head)
	end
end

IO.puts MyList.max_nr [3,2,5,1] 			# 5
IO.puts MyList.max_nr [1,2,3, 4] 			# 4
IO.puts MyList.max_nr [10,3, 4, 5, 6, 1] 	# 10