defmodule Day17 do
  def nextIndex(list, cur, dist\\ 1) do
    wrap = rem(dist, length(list))
    if cur + wrap > length(list) - 1, do: (cur + wrap) - length(list), else: cur + wrap
  end

  def spinLock(steps, max, find, list\\ [0], index\\ 0) do
    if length(list) <= max do
      newIndex = nextIndex(list, index, steps) + 1
      newList = List.insert_at(list, newIndex, length(list))
      spinLock(steps, max, find, newList, newIndex)
    else
      Enum.at(list, Enum.find_index(list, &(&1 == find)) + 1)
    end
  end
end

Day17.spinLock(349, 50000000, 0)
|> IO.inspect