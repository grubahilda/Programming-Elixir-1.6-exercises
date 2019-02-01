defmodule Chop do

	def guess(number, min..max) when number > div(min + max,2) do
		IO.puts "It is #{div(min + max,2)}"
		guess(number,div(min + max,2)..max)
	end

	def guess(number, min..max) when number < div(min + max,2) do
		IO.puts "It is #{div(min + max,2)}"
		guess(number,min..div(min + max,2))
	end

	def guess(number, min..max) when number == div(min + max,2) do
		IO.puts "It is #{div(min + max,2)}"
	end

end

IO.puts Chop.guess(273,1..1000)