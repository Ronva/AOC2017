const input = 368078;

// should output 0, 3, 2, 31
const testInput = [1, 12, 23, 1024];

const findDist = (finish) => {
  let side = 1;
  while (finish > side * side) side += 2;
  return ((side - 1) / 2) + Math.abs(Math.floor(side / 2) - ((finish - Math.pow(side - 2, 2)) % (side > 1 ? side - 1 : 1)));
};

const sumNeighbors = (grid, currentIndexes) => {
  const x = currentIndexes.x;
  const y = currentIndexes.y;
  let sum = 0;
  const adjacent = [[x+1,y],[x+1,y+1],[x,y+1],[x-1,y+1],[x-1,y],[x-1,y-1],[x,y-1],[x+1,y-1]];
  adjacent.map(n => sum += grid[n[0]][n[1]] ? grid[n[0]][n[1]] : 0);
  return sum;
};

for (let test of testInput) {
  console.log(`${test}: ${findDist(test)}`);
}

console.log(findDist(input));
