defmodule Centering do

	def max_len_word(list), do: Enum.max(Enum.map(list, &(String.length(&1))))
	def centering(list) do

	end

end

IO.inspect Centering.centering(["cat", "dog", "mouse", "pig"])