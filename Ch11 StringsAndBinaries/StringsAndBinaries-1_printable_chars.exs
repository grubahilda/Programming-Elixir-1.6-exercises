defmodule PrintableChars do

	def printable_ascii([]), do: true
	def printable_ascii([digit | tail]) do
		if digit in 32..126 do
			true
		else
			false
		end
	end

end

IO.inspect PrintableChars.printable_ascii([0])					# false
IO.inspect PrintableChars.printable_ascii('Say whaaat?')		# true
IO.inspect PrintableChars.printable_ascii([11, 22, 33, 44])		# false