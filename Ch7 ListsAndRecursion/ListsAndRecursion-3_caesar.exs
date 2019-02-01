defmodule Caesar do
	
	def caesar([], _n), do: []

	def caesar([head|tail], n) when head + n < 122 do
		[head + n|caesar(tail, n)]
	end

	def caesar([head|tail], n) when head + n > 122 do
		[head-26+n|caesar(tail, n)]
	end
end

IO.puts Caesar.caesar('hvmov',5)   	# marta
IO.puts Caesar.caesar('ryvkve',13)  # elixir