defmodule MyList do
	
	def mapsum(list, func), do: mapsum(list, func, 0) # initial value is 0

	def mapsum([], _func, tmp_sum), do: tmp_sum # to be called last to display the result
	def mapsum([head|tail], func, tmp_sum), do: mapsum(tail, func, tmp_sum + func.(head))

end

IO.puts MyList.mapsum [1,2,3], &(&1 * &1) # 14
IO.puts MyList.mapsum [1,2,3], &(&1 + &1) # 12
IO.puts MyList.mapsum [1,2,3], &(&1 + 1) # 9