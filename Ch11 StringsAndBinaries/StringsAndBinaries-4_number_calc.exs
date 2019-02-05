defmodule NumberCals do
	
	def calc(string) do
		string
			|> List.to_string
			|> String.split([" "])
			|> compute
	end

	def compute([nr1, sign, nr2]) do
		case sign do
		"+" -> String.to_integer(nr1) + String.to_integer(nr2)
		"-" -> String.to_integer(nr1) - String.to_integer(nr2)
		"*" -> String.to_integer(nr1) * String.to_integer(nr2)
		"/" -> if(nr2 == "0", do: "Can't divide by 0", else: String.to_integer(nr1) / String.to_integer(nr2))
		_ 	-> "Invalid operation"
		end
	end

end

IO.inspect NumberCals.calc('123 + 666')			# 789
IO.inspect NumberCals.calc('123 - 66')			# 57
IO.inspect NumberCals.calc('12 * 6')			# 72
IO.inspect NumberCals.calc('123 / 6')			# 20.5
IO.inspect NumberCals.calc('123 / 0')			# "Can't divide by 0"
IO.inspect NumberCals.calc('123 = 0')			# "Invalid operation"