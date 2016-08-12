function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}
 // in block, in block

 function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}
// in block, out of block

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}
// error because x has already been declared as a const, so cannot change type to var

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}
// in block, out of block

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

// error: x has already been declared

/* madLib

Write a function that takes three strings - a verb, an adjective, and a noun - and interpolates them into the sentence "We shall verb the adjective noun" using ES6 template literals.

Input: three strings

Output:

  > madLib('fly', 'iridescent', 'zoo');
  "We shall fly the iridescent zoo."

  > madLib('eat', 'rolling', 'cactus');
  "We shall eat the rolling cactus." */

  function madLib (verb, adj, noun) {
    return `We shall ${verb} the ${adj} ${noun}.`
  }


/* isOdd

Input: A Number.

Output: A Boolean. true if the number is odd, otherwise false

> isOdd(2)
false

> isOdd(5)
true

> isOdd(-17)
true */

function isOdd (number) {
  return Math.abs(number)%2 === 1;
}

/* yell

Input: A String. Assume no punctuation.

Output: A String. A yelled version of the input.

> yell("I want to go to the store")
"I WANT TO GO TO THE STORE!!!"

> yell("Time to program")
"TIME TO PROGRAM!!!" */

function yell (string) {
  return string.toUpperCase();
}

/* isSubstring

Input

1) A String, called searchString.
2) A String, called subString.
Output: A Boolean. true is the subString is a part of the searchString.

> isSubstring("The cat went to the store", "he cat went")
true

> isSubstring("time to program", "time")
true

> isSubstring("Jump for joy", "joys")
false */

function isSubstring (searchString, subString) {
  return searchString.indexOf(subString) !== -1;
}

/* fizzBuzz

3 and 5 are magic numbers. Define a function fizzBuzz(array) that takes an array returns a new array of every number in the array that is divisible by either 3 or 5, but not both. */

function fizzBuzz(array) {
  let notByFifteen = [];
  for (let i = 0; i < array.length; i++) {
    let el = array[i];
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      notByFifteen.push(el);
    }
  }
  return notByFifteen;
}

function isPrime(number) {
  for (let i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }
  return true;
}

function sumOfNPrimes(n) {
  let sum = 0;
  let i = 2;
  let count = 0;
  while (count < n) {
    if (isPrime(i)) {
      sum += i;
      count += 1;
    }
    i++;
  }
  return sum;
}

function printChildren(parent, ...children) {
  console.log(`${parent}s children are:`);
  children.forEach( child => {
    console.log(child);
  });
}

function addThree(...arr) {
  let sum = 0;
  arr.forEach( el => {
    sum += el
  });
  return sum;
}

function dinnerTonightIs(food='pizza') {
  console.log(`Dinner tonight is ${food}.`);
}
