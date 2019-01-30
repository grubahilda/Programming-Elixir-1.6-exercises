defmodule SpanModule do

	def span(from, to) when to < from, do: span(to, from)
	def span(from, to) when from == to, do: [from]
	def span(from, to) when from < to, do: [from|span(from + 1,to)]

end

IO.inspect SpanModule.span(5,15)