defmodule TaxCalc do
  def file_to_keyword_list() do
    case File.open("sales_information.txt", [:read]) do
      {:ok, file} -> process_headers(IO.read(file, :line)) |> process_rows(file)
      {:error, message} -> message
    end
  end

  def process_headers(data) do
    data
    |> String.trim()
    |> String.split(",")
    |> Enum.map(&String.strip(&1))
    |> Enum.map(&String.to_atom(&1))
  end

  def process_rows(header, file) do
    value = Enum.map(IO.stream(file, :line), fn row -> single_line(row) end)

    # Enum.zip(header, value)
  end

  def single_line(data) do
    sin_line =
      data
      |> String.trim()
      |> String.split(",")
      |> Enum.map(&String.strip(&1))

    Enum.map(data, reformat_data(sin_line))

    # |> replace_float
    # |> replace_atom
  end

  def reformat_data(data) do
    # [replace_integer(data), replace_atom(data), replace_float(data)]
    [replace_integer(data), :NX, 123.4]
  end

  # def replace_float(data) do
  #   data
  #   |> Enum.take(1)

  #   List.replace_at(0, Enum.take(data))
  #   |> Enum.take()
  # end

  def replace_integer(data) do
    {int, ""} =
      data
      |> List.first()
      |> Integer.parse()

    int
  end

  # def replace_atom(data) do
  #   data
  #   |> Enum.fetch(1)
  # end
end

IO.inspect(TaxCalc.file_to_keyword_list())
