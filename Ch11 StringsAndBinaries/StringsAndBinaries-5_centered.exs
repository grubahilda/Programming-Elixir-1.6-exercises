defmodule Centering do
  def max_len_word(list), do: Enum.max(Enum.map(list, &String.length(&1)))

  def centering(list), do: _centering(list, max_len_word(list))

  def _centering([], _max_len), do: :ok

  def _centering([head | tail], max_len) do
    placeholder = String.duplicate(" ", trunc(0.5 * (max_len - String.length(head))))
    IO.puts(placeholder <> head <> placeholder)
    _centering(tail, max_len)
  end
end

IO.inspect(Centering.centering(["table", "dog", "rabbit", "rododendron"]))
IO.inspect(Centering.centering(["Heyeeaa", "Heyeeaayeeaayeye", "I said hey? What's going on"]))
IO.inspect(Centering.centering(["My name is", "Bong", "Jane Bong"]))
