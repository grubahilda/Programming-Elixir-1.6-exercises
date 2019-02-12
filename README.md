# Programming Elixir 1.6 - exercises

Learning Elixir from the book *Programming Elixir 1.6* by Dave Thomas (version May 2018). In the Book, apart from basic syntax explanation, the author shows many examples and also challenges the reader to try coding on her own. I want to keep track on what I've learned and I created this repo for my future reference as well as sense of progress that I make.

## Latest learning notes

#### 12/02/2019

##### mix - basic commands
* `mix new project_name` - creates a new elixir project in the current location
* `mix test` - starts project tests
* `mix run my_app.exs` - run the project
* `mix run my_app.exs arg1 arg2` - run the project with command-line arguments
* `mix run -e 'Issues.CLI.run(["-h"])'` - run the code with `-e` (evaluate) option
* `mix deps` - lists dependencies and their statuses
* `mix deps.get` - gets dependencies that are not available or out of date


#### 6/02/2019

##### Binaries

* Double-quoted strings are stored as a consecutive sequence of bytes in UTF-8 encoding
* Rather than use `[ head | tail ]`, we use `<< head::utf8, tail::binary >>`. And rather than terminate when we reach the empty list, `[]`, we look for an empty binary, `<<>>`.

#### 5/02/2019

**Strings interpolation:** when they include placeholders for corresponding values/variables<br>
**Strings escape:** when they include the backlash `(\)` escape sequences

#####Sigils:
* `~C`- a character list with no escaping or interpolation
* `~c` – a character list, escaped and interpolated just like a single-quoted string
* `~D` – a `Date` in the format `yyyy-mm-dd`
* `~N` – a naive (raw) `DateTime` in the format `yyyy-mm-dd hh:mm:ss[.ddd]`
* `~R` – a regular expression with no escaping or interpolation
* `~r` – a regular expression, escaped or interpolated
* `~S` – a string with no escaping or interpolation
* `~s` – a string, escaped and interpolated just like a double-quoted string
* `~T` – a `Time` in the format `hh:mm:ss[.dddd]`
* `~W` – a list of whitespace-delimited words, with no escaping or interpolation
* `~w` – a list of whitespace-delimited words, with escaping and interpolation



**Single-quoted form:** referred to as a character list, represented as a list of integer values<br>
Example: `[67, 65, 84]` –> `’CAT’`<br>
**Double-quoted string:** can be called strings<br>
**Triple string delimiter:** used in `heredoc`, indent the same as in string contents


### 4/02/2019

#### Streams - composable enumerators
* lazy enumerables
* the elements being enumerated are created one by one, during enumeration
* allow to map the range, triggering its enumeration (computation occurred only after using `Enum.map`):
```commandline
iex> range = 1..5
iex> stream = Stream.map(range, &(&1 * 2))
iex> Enum.map stream, &(&1*2)
[4, 6, 8, 10, 12]
```
* composable means that you can pass a stream to a stream function
* with streams the data can be processed as they arrive
* sometimes slower than `Enum` but Enum implementation requires waiting for all the lines before the processing of data is started

#### Comprehensions

Syntax:
 ```
 result = for generator or filter .. [, into: value], do: expression
 ```
 
 Examples:
 ```commandline
for x <- [1, 2, 3, 4, 5], do: x + 2
for x <- [2, 4, 6, 8], x > 4, do: x * x
```

* all variable assignments are local to that comprehension

### 1/02/2019

#### Structs
* limited forms of map
* created inside of a module
created using `defmodule` macro
* the name of the module becomes the name of the map type
* keys must be atoms
* to assign some default values to keys and limit them

##### Creating a struct
The struct `%User{}`:
```commandline
defmodule User do
    defstruct name: "", premium: false, admin: false
end
```


### 30/01/2019

#### How to choose between Maps, Structs, and Keyword Lists
* When using patter matching against the contents - **_map_**
* When in need of more than one entry with the same key - `Keyword` **_module_**
* When in need of elements ordering - `Keyword` **_module_**
* When using data that is always structured the same - **_struct_**
* Otherwise - **_map_** will do

#### To access keyword list elements:
* by using keyword_list[key], for example:
```commandline
iex(1)> kl = [one: "one", two: "two"]
iex(2)> kl[:two]
"two"
```
* by using `get` function of the `Keyword` module:
```commandline
iex(1)> kl = [one: "one", two: "two"]
[one: "one", two: "two"]
iex(2)> Keyword.get(kl, :one)
"one"
```
* getting all values of the same duplicated keys by using `key_values` function:
```commandline
iex(1)> kl = [one: "one", two: "two", one: "another_one"]
[one: "one", two: "two", one: "another_one"]
iex(2)> Keyword.get_values(kl, :one)
["one", "another_one"]
```

#### Sets

* can't contain duplicate elements
* is constructed using `MapSet.new/0`
* represented by `#MapSet<[]>` struct



### 29/01/2019
* **Directives** are: `import` (can add `only: [function, arity]` or `except`), `alias`, `require`
* **Attributes of a module**: at the beginning, starting with `@`, used as metadata of the module, for example `@name`
* **Erlang functions**: variables start with uppercase and atoms are lowercase. So, to refer to Erlang function `tc` in module `timer`, write `:timer.tc`, or for erlang `format`, write `:io.format`
 

## Initial notes

**Start command prompt shell (when in the folder with mix project):**
`iex -S mix`

**Start command prompt shell (when in any folder):**
`iex.bat`

***

**Start new project:**

```commandline
mix new project_name
defmodule Drop do
end
```

***

**Modules:** each in a new file. Name starts in the upper case. By creating functions in modules and connecting them, there is a larger program.

***

**Useful functions:**

`div(a, b)` 	–>	 division<br>
`rem(a, b)` 	–>	 modulo
***

**Referring to build-in functions:**
For example from math module:
```commandline
:math.pi() #(or no brackets at all)
:math.pow(2,16)
```
***

**Maps** are basically like dictionaries in python. Order does not matter (it does in tuples).<br>
There is a key, there is a value Syntax:<br>
```%{key1 => value1, key2 => value2}```

Anything can be a key: an atom, number as well
`%{:earth => 9.8, :moon => 1.6}` but also if all keys are atoms, simply `%{earth: 9.8, moon: 1.6}`.

**Updating maps *only by* creating a new map** (if you want to store the result). The key must already exist in the map.

When storing `altered_map = %{new_map | moon: 16}`<br>

Updating multiple key–value pairs:<br>
`*%{new_map | earth: 12, moon: 1}`<br> or<br> `%{new_map | :earth => 12, :moon => 1}`

**Adding key-value pair** (only by creating a new map that includes the original map + new items):<br>
`Extended_map = Map.put_new(new_map, :jupiter, 23.1)`

Reading maps through pattern matching:<br>
```commandline
%{earth: earth_gravity} = new_map
earth_gravity 
9.8
```


**Keyword lists:**<br>
* Keys are atoms
* Keys are ordered as developer specifies it
* Keys can be given more than once
* Keys can be repeated

**Maps:**
* Maps allow any value as key
* Very useful in pattern matching
* Don't care about ordering
* Only one entry for a particular key

***

**Structs are based on maps** – order does not matter. They provide compile-time checks and default values for the fields.
Need to be declared by `defstruct` inside of the `defmodule`. Takes module’s name
`defstruct name: :nil, gravity: 0, diameter: 0`.

***

`#{}` – *string interpolation*
***

**Getting input from the user:**<br>
`Name = IO.gets(“What is your name? ”)`

***
