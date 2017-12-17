import input from './input';

// should output 5
const testInput = "0 3 0 1 -3";

const step = (arr, index = 0, steps = 0) => {
  if (index >= 0 && index < arr.length) {
    const newSteps = steps + 1;
    const newArr = [...arr.slice(0, index), arr[index] + 1, ...arr.slice(index + 1)];
    step(newArr, index + arr[index], newSteps);
  }
  else {
    console.log(steps);
  }
};

// console.log(step(testInput.split(' ').map(num => parseInt(num))));
step(input.split('\n').map(num => parseInt(num)));
