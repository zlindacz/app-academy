const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers (sum, numsLeft, completionCallback) {
  reader.question('Enter a number to add: ', function (response) {
    if (numsLeft === 1) {
      console.log(completionCallback(sum));
      reader.close();
    }

    sum += parseInt(response);
    console.log(sum);
    addNumbers (sum, numsLeft-1, completionCallback);

  });
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
