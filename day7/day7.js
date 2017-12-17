const testInput = "pbga (66)\n" +
"xhth (57)\n" +
"ebii (61)\n" +
"havc (66)\n" +
"ktlj (57)\n" +
"fwft (72) -> ktlj, cntj, xhth\n" +
"qoyq (66)\n" +
"padx (45) -> pbga, havc, qoyq\n" +
"tknk (41) -> ugml, padx, fwft\n" +
"jptl (61)\n" +
"ugml (68) -> gyxo, ebii, jptl\n" +
"gyxo (61)\n" +
"cntj (57)";

const findParent = (arr) => {
  const childless = [];
  const completed = {};
  arr.map(item => {
    if (item.split('->').length > 1) {
      completed[item.split('->')[0].trim()] = item.split('->')[1].trim();
    }
    else {
      childless.push(item)
    }
  });
  return completed;
};

const buildTower = (cl, co) => {
  if (cl.length > 1 && Object.keys(co).length > 1) {

  }
  else {
    return co;
  }
};

console.log(findParent(testInput.split('\n')));
