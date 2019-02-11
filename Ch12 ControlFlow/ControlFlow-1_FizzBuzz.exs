defmodule FizzBuzz do
	def fizzbuzz(n), do: _fizzbuzz(1, n, [])

	def _fizzbuzz(start, n, res) when n >= start do
		tmp = case {rem(start,3), rem(start, 5)} do
			{0, 0} 	-> ["FizzBuzz"]
			{0, _} 	-> ["Fizz"]
			{_, 0} 	-> ["Buzz"]
			{_, _}	-> [start]
		end
		_fizzbuzz(start + 1, n, res ++ tmp)
	end

	def _fizzbuzz(_start, _n, res), do: res
end

IO.inspect FizzBuzz.fizzbuzz(30)