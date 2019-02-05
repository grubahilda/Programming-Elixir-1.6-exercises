defmodule Anagram do
	def anagram?(word1, word2) do

		if word1 |> String.downcase == word2 |> String.downcase |> String.reverse do
			true
		else
			false
		end
	end
end

IO.inspect Anagram.anagram?("kayak", "yakay")			# false
IO.inspect Anagram.anagram?("marta", "atram")			# true
IO.inspect Anagram.anagram?("Marta", "atram")			# true
IO.inspect Anagram.anagram?("ElViS", "sIvLe")			# true