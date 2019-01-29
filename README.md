# Programming Elixir 1.6 - exercises

Learning Elixir from the book *Programming Elixir 1.6* by Dave Thomas (version May 2018). In the Book, apart from basic syntax explanation, the author shows many examples and also challenges the reader to try coding on her own. I want to keep track on what I've learned and I created this repo for my future reference as well as sense of progress that I am making.

# Latest learning notes

## 29/01
* **Directives** are: `import` (can add `only: [function, arity]` or `except`), `alias`, `require`
* **Attributes of a module**: at the beginning, starting with `@`, used as metadata of the module, for example `@name`
* **Erlang functions**: variables start with uppercase and atoms are lowercase. So, to refer to Erlang function `tc` in module `timer`, write `:timer.tc`, or for erlang `format`, write `:io.format`

 

# Initial notes

**Start command prompt shell:**
`iex -S mix`

***

**Start new project:**

```
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
```
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
```
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
