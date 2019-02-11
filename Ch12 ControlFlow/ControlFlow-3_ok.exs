defmodule ControlFlow do
	
	def ok!(data) do
		case data do
			{:ok, file}			-> file
			{:error, message}	-> raise "Problem opening the file: #{message}"
		end
	end

end

ControlFlow.ok! File.read("ControlFlow-1_FizzBuzz.exs")