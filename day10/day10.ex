testSize = Enum.to_list(0..4)
testInput = [3, 4, 1, 5, 2, 3, 1]

size = Enum.to_list(0..255)
input = [102,255,99,252,200,24,219,57,103,2,226,254,1,0,69,216]

defmodule Day10 do
  def nextIndex(list, cur, dist\\ 1) do
    wrap = rem(dist, length(list))
    if cur + wrap > length(list) - 1, do: (cur + wrap) - length(list), else: cur + wrap
  end

  def reverse(list, s, dist) do
    e = nextIndex(list, s, dist - 1)
    cond do
      s < e && s == 0 -> Enum.reverse(Enum.slice(list, s..e)) ++ Enum.slice(list, (e+1)..-1)
      e < s && e == 0 -> Enum.reverse(Enum.slice(list, e..s)) ++ Enum.reverse(Enum.slice(list, (s+1)..-1))
      e < s -> Enum.reverse(Enum.slice(list, s..-1)) ++ Enum.slice(list, (e+1)..(s-1)) ++ Enum.reverse(Enum.slice(list, 0..e))
      true -> Enum.slice(list, 0..(s-1)) ++ Enum.reverse(Enum.slice(list, s..e)) ++ Enum.slice(list, (e+1)..-1)
    end
  end

  def hash(list, lengths, cur\\ 0, skip\\ 0) do
    IO.inspect(list)
    if skip < length(lengths) do
      len = Enum.at(lengths, skip)
      newList = reverse(list, cur, len)
      IO.inspect(nextIndex(list, cur, len + skip))
      hash(newList, lengths, nextIndex(list, cur, len + skip), skip + 1)
    else
      Enum.at(list, 0) * Enum.at(list, 1)
    end
  end
end

Day10.hash(testSize, testInput)
|> IO.inspect

#Day10.reverse([3, 4, 2, 1, 0], )