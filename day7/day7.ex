testInput = String.split("pbga (66)
xhth (57)
ebii (61)
havc (66)
ktlj (57)
fwft (72) -> ktlj, cntj, xhth
qoyq (66)
padx (45) -> pbga, havc, qoyq
tknk (41) -> ugml, padx, fwft
jptl (61)
ugml (68) -> gyxo, ebii, jptl
gyxo (61)
cntj (57)", "\n")

defmodule Day7 do
  def findParents(list) do
    childless = Enum.filter(list, &(length(String.split(&1, " -> ")) == 1))
    clean = Enum.map(childless, &(cleanNode(&1)))
    sorted = Enum.filter(list, &(length(String.split(&1, " -> ")) > 1))
    completed = listToMap(sorted)
    joinTowers(completed)
  end

  def listToMap(list) do
    Enum.map(list, &(String.split(&1, " -> ")))
    |> Map.new(fn[a, b] -> {cleanNode(a), String.split(b, ", ")} end)
  end

  def cleanNode(node) do
    Enum.at(String.split(node), 0)
  end

  def buildTower(cl, co) do
    if length(cl) > 0 do

    else
      co
    end
  end

  def joinTowers(co, final\\ %{}) do
    if length(Map.keys(co)) > 1 do
      Enum.map(co, fn(t) -> {IO.inspect(t)} end)
    else
      co
    end
  end
end

IO.inspect(Day7.findParents(testInput))