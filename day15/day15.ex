factors = [16807, 48271]

input = [516, 190]
testInput = [65, 8921]

defmodule Day15 do
  def nextVal(val, gen, const, rest\\ 0) do
    newVal = rem(val * gen, const)
    if rest != 0 && rem(newVal, rest) != 0 do
      nextVal(newVal, gen, const, rest)
    else
      newVal
    end
  end

  def endBits(num, bit\\ 0, bits\\ "") do
    if bit < 16 && num > 0 do
      nextBit = if Integer.mod(num, 2) == 1, do: "1", else: "0"
      newBits = nextBit <> bits
      endBits(Float.floor(num / 2) |> round, bit + 1, newBits)
    else
      bits
    end
  end

  def judge(gens, factors, div, max, rest\\ [0, 0], i\\ 0, pairs\\ 0) do
    if i < max do
      a = nextVal(Enum.at(gens, 0), Enum.at(factors, 0), div, Enum.at(rest, 0))
      b = nextVal(Enum.at(gens, 1), Enum.at(factors, 1), div, Enum.at(rest, 1))
      newPairs = if endBits(a) == endBits(b), do: pairs + 1, else: pairs
      judge([a, b], factors, div, max, rest, i + 1, newPairs)
    else
      "Total pairs: #{pairs}"
    end
  end
end

Day15.judge(input, factors, 2147483647, 5000000, [4, 8])
|> IO.inspect

#Day15.nextVal(7, 6, 40, 3)
#|> IO.inspect