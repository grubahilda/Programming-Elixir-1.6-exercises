defmodule CapitalizeSent do

	def capitalize_string(sentence) do
		sentence
			|> String.split(".", trim: true)
			|> _capitalize_string()
	end

	def _capitalize_string([]), do: ""
	def _capitalize_string([head|tail]) do
		head_new = head
			|> String.trim
			|> String.capitalize
		Enum.join([head_new, _capitalize_string(tail)], ". ") |> String.trim
	end

end

IO.inspect CapitalizeSent.capitalize_string("HELLO. yes. this is dog.")				# "Hello. Yes. This is dog."
IO.inspect CapitalizeSent.capitalize_string("I am not SURE. but. let's try.")		# "I am not sure. But. Let's try."