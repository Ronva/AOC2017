input = String.split("0: 5
1: 2
2: 3
4: 4
6: 8
8: 4
10: 6
12: 6
14: 8
16: 6
18: 6
20: 12
22: 14
24: 8
26: 8
28: 9
30: 8
32: 8
34: 12
36: 10
38: 12
40: 12
44: 14
46: 12
48: 10
50: 12
52: 12
54: 12
56: 14
58: 12
60: 14
62: 14
64: 14
66: 14
68: 17
70: 12
72: 14
76: 14
78: 14
80: 14
82: 18
84: 14
88: 20", "\n")

testInput = String.split("0: 3
1: 2
4: 4
6: 4", "\n")

defmodule Day13 do
  def mapInput(list) do
    Map.new(list, fn (str) ->
      split = String.split(str, ": ")
      key = Enum.at(split, 0) |> String.to_integer
      val = Enum.at(split, 1) |> String.to_integer
      {key, [0, val, "d"]}
      end
    )
  end
  
  def updateScanner(s) do
    curDir = Enum.at(s, 2)
    newPos = cond do
      curDir == "d" -> Enum.at(s, 0) + 1
      curDir == "u" -> Enum.at(s, 0) - 1
    end
    newDir = cond do
      newPos == 0 -> "d"
      newPos == Enum.at(s, 1) - 1 -> "u"
      true -> curDir
    end
    [newPos, Enum.at(s, 1), newDir]
  end

  def picosecond(map, pos\\ -1, sev\\ 0, valid\\ true) do
    if pos < Map.keys(map) |> Enum.max && valid do
      newPos = pos + 1
      caught = Enum.member?(Map.keys(map), newPos) && Enum.at(map[newPos], 0) == 0
      if caught do IO.puts("Caught at position #{newPos}") end
      newSev = if caught, do: sev + (newPos * Enum.at(map[newPos], 1)), else: sev
      newMap = for {k, v} <- map, into: %{}, do: {k, updateScanner(v)}
      IO.inspect(map)
      picosecond(newMap, pos + 1, newSev, !caught)
    else
      valid
    end
  end

  def avoid(map, delay\\ -1) do
    valid = picosecond(map, delay)
    if !valid do
      avoid(map, delay - 1)
    else
      delay + 1
    end
  end
end

#Day13.mapInput(input)
#|> Day13.avoid
#|> IO.inspect

#list = for {k, v} <- Day13.mapInput(input), into: [], do: k * Enum.at(v, 1)
#Enum.max(list)
#|> IO.inspect()

Day13.picosecond(Day13.mapInput(testInput), -11)
|> IO.inspect