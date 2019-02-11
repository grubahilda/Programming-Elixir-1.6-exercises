defmodule TaxCalc do
	
	def file_to_keyword_list() do
		case File.open("sales_information.txt", [:read]) do
		{:ok, file}			-> process_headers(IO.read(file, :line)) |> process_rows(file)
		{:error, message} 	->	message
		end
	end


	def process_headers(data) do
		data
			|> String.trim
			|> String.split(",")
			|> Enum.map(&(String.strip(&1)))
			|> Enum.map(&(String.to_atom(&1)))
	end

	def process_rows(header, file) do
		value = Enum.map IO.stream(file, :line), fn(row) -> single_line(row) end
		#Enum.zip(header, value)
	end

	def single_line(data) do
		data
			|> String.trim
			|> String.split(",")
			|> Enum.map(&(String.strip(&1)))

	end
end

IO.inspect TaxCalc.file_to_keyword_list()