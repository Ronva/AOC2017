import input from './input';

// should output valid, invalid, valid, invalid, valid, invalid
const testInput = ["aa bb cc dd ee", "aa bb cc dd aa", "aa bb cc dd aaa", "bqs bqs dbutvgf mmzb izpyud rap izpyud xlzeb mnj hjncs", "iiii oiii ooii oooi oooo", "oiii ioii iioi iiio"];

const validate = (phrase, anagram = false) => {
  let isValid = true;
  let newPhrase = phrase.split(' ');
  if (anagram) {
    newPhrase = newPhrase.map(word => sortString(word));
  }
  for (let i = 0; i < newPhrase.length; i++) {
    if ([...newPhrase.slice(i + 1)].includes(newPhrase[i])) {
      isValid = false;
      break;
    }
  }
  return isValid;
};

const sortString = (str) => {
  return str.split('').sort().join('').trim().toLowerCase();
};

// for (let test of testInput) {
//   console.log(validate(test, true));
// }

let totalValid = 0;
for (let phrase of input.split('\n')) {
  validate(phrase, true) ? totalValid += 1 : null;
}
console.log(totalValid);
