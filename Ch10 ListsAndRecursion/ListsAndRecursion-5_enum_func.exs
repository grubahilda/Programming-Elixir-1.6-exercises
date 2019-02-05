defmodule RecursionEnumFunctions do

	#--------------------------------------------------------------------
	# new Enum.all? function
	def new_all?([], _func), do: true
	def new_all?([head|tail], func) do
		if func.(head), do: new_all?(tail, func), else: false
	end


	#--------------------------------------------------------------------
	# new Enum.aplit function
	def new_split(list, n) when n >= 0, do: _new_split(list, n, []) # initial result list
	def new_split(list, n) when n < 0, do: _new_split(list, n + length(list), [])
	defp _new_split([head|tail], n, result) when n > length(result) do
		_new_split(tail, n, result ++ [head])
	end
	defp _new_split(list, _n, result), do: {result, list}



	#--------------------------------------------------------------------
	# new Enum.filter function
	def new_filter([], _func), do: []
	def new_filter([head|tail], func) do
		if func.(head) == true do
			[head|new_filter(tail, func)]
		else
			new_filter(tail, func)
		end
	end


	#--------------------------------------------------------------------
	# new Enum.each function

	def new_each([], _func), do: :ok
	def new_each([head|tail], func) do
		func.(head) |> IO.puts
		new_each(tail, func)
	end


	#--------------------------------------------------------------------
	# new Enum.take function
	def new_take(list, n) when n >= 0, do: _new_take(list, n, [])
	def new_take(list, n) when n < 0, do: _new_take_neg(list, n + length(list), [], 0)
	defp _new_take([], _n, _res), do: []
	defp _new_take([head|tail], n, res) when n > length(res), do: _new_take(tail, n, res ++ [head])
	defp _new_take(_list, _n, res), do: res
	defp _new_take_neg([head|tail], n, res, count) when count >= n, do: _new_take_neg(tail, n, res ++ [head], count + 1)
	defp _new_take_neg([head|tail], n, res, count) when length([head|tail]) > 0, do: _new_take_neg(tail, n, res, count + 1)
	defp _new_take_neg(_list, _n, res, _count), do: res

end


#IO.puts RecursionEnumFunctions.new_all?([2, 3, 4, 5, 6], &(&1 > 0))		# true
#IO.puts RecursionEnumFunctions.new_all?([1,121], &(&1 == 1))				# false
#IO.inspect RecursionEnumFunctions.new_split([1, 2, 3, 4, 5], 3)			# {[1,2,3],[4,5]}
#IO.inspect RecursionEnumFunctions.new_each([1,2,3,4,5], &(&1*3))			# 3,6,9,12,15, :ok	
#IO.inspect RecursionEnumFunctions.new_filter([1,2,3,4,5,6], &(&1 < 5))		# [2,4]
IO.inspect RecursionEnumFunctions.new_take([1,2,3,4,5,6],-1)				# [6]
