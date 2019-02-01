defmodule RecursionEnumFunctions do

	def new_all?([], _func), do: true
	def new_all?([head|tail], func) do
		if func.(head), do: new_all?(tail, func), else: false
	end


	def new_split(list, n), do: _new_split(list, n, 0) # initial "index" value
	def _new_split([], _n, 0), do: {[],[]}
	def _new_split([head|tail], n, val) do
		if n > val do
			[head]
			_new_split(tail, n, val + 1)
		else
			[head|tail]
		end
	end

end

#defmodule MyReduce do
	
#	def mapsum(list, func), do: mapsum(list, func, 0) # initial value is 0

#	def _mapsum([], _func, tmp_sum), do: tmp_sum # to be called last to display the result
#	def _mapsum([head|tail], func, tmp_sum), do: mapsum(tail, func, tmp_sum + func.(head))

#end

#IO.puts RecursionEnumFunctions.new_all?([2, 3, 4, 5, 6], &(&1 > 0))
#IO.puts RecursionEnumFunctions.new_all?([1,121], &(&1 == 1))
IO.inspect RecursionEnumFunctions.new_split([1, 2, 3, 4, 5], 3)