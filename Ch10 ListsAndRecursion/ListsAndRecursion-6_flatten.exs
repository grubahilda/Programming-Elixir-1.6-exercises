defmodule FlattenModule do
	def new_flatten([]), do: []
	def new_flatten([head|tail]) when is_list(head), do: new_flatten(head) ++ new_flatten(tail)
	def new_flatten([head|tail]), do: [head] ++ new_flatten(tail)
end

IO.inspect FlattenModule.new_flatten([1,2,[3],[[4,5],[6,[7,[8,[[9]]]]]]])