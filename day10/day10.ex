testSize = 5
testInput = [3, 4, 1, 5]

defmodule Day10 do
  def indexIncrement(list, cur, dist\\ 1) do
    fromEnd = length(list) - cur
    if fromEnd <= dist, do: dist - fromEnd, else: cur + dist
  end

end
