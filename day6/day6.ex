input = [14, 0, 15, 12, 11, 11, 3, 5, 1, 6, 8, 4, 9, 1, 8, 4]
testInput = [0, 2, 7, 0]

defmodule Day6 do
  def findLargest(list) do
    Enum.find_index(list, fn(x) -> x == Enum.max(list) end)
  end

  def indexIncrement(list, cur, dist\\ 1) do
    fromEnd = length(list) - cur
    if fromEnd <= dist, do: dist - fromEnd, else: cur + dist
  end

  def emptyBank(list) do
    index = findLargest(list)
    blocks = Enum.at(list, index)
    emptied = List.replace_at(list, index, 0)
    redistribution(emptied, indexIncrement(list, index), blocks)
  end

  def redistribution(list, index, total) do
    if total > 0 do
      newList = List.replace_at(list, index, Enum.at(list, index) + 1)
      newIndex = indexIncrement(list, index)
      newTotal = total - 1
      redistribution(newList, newIndex, newTotal)
    else
      list
    end
  end

  def run(list, pastLists, cycle\\ false) do
    mapSize = length(Map.keys(pastLists))
    newest = emptyBank(list)
    if Map.has_key?(pastLists, newest) do
      if cycle, do: newest, else: mapSize
    else
      run(newest, Map.merge(pastLists, %{newest => mapSize}), cycle)
    end
  end

  def cycles(list) do
    solution = run(list, %{list => 0}, true)
    IO.inspect(solution)
    result = run(solution, %{solution => 0})
    result
  end
end

# should return 1
#IO.puts(Day6.findLargest([1,4,3,2]))

# should return [2, 4, 1, 2]
#IO.inspect(Day6.emptyBank(testInput, Day6.findLargest(testInput)))

# should return 5
#IO.puts(Day6.run(testInput, %{testInput => 0}))

#IO.puts(Day6.indexIncrement([0, 1, 2, 3], 2, 3))

#IO.puts(Day6.cycles(input))
