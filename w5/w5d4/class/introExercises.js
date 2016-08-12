// Array.prototype.myUniq = function () {
//   let uniq = [];
//   for (let i = 0; i < this.length; i++) {
//     if ( uniq.indexOf(this[i]) === -1 ) {
//       uniq.push(this[i]);
//     }
//   }
//   return uniq;
// };

function myUniq(array) {
  let uniq = [];
  for (let i = 0; i < array.length; i++) {
    if ( uniq.indexOf(array[i]) === -1 ) {
      uniq.push(array[i]);
    }
  }
  return uniq;
}

// console.log(myUniq([1, 2, 2, 2, 3 ,4]));

//
// Array.prototype.myTwoSum = function() {
//   let twoSum = [];
//   for (let i = 0; i < this.length; i++) {
//     for (let j = i+1; j < this.length; j++) {
//       if ( this[i] + this[j] === 0 ) {
//         twoSum.push([i, j]);
//       }
//     }
//   }
//   return twoSum;
// };

function myTwoSum(array) {
  let twoSum = [];
  for (let i = 0; i < array.length; i++) {
    for (let j = i+1; j < array.length; j++) {
      if ( array[i] + array[j] === 0 ) {
        twoSum.push([i, j]);
      }
    }
  }
  return twoSum;
}

// Array.prototype.myTranspose = function() {
//   let transposedArray = [];
//   for (let i = 0; i < this[0].length; i++) {
//     let newRow = [];
//     for (let j = 0; j < this.length; j++) {
//       newRow.push(this[j][i]);
//     }
//     transposedArray.push(newRow);
//   }
//
//   return transposedArray;
// };


function myTranspose(array) {
  let transposedArray = [];
  for (let i = 0; i < array[0].length; i++) {
    let newRow = [];
    for (let j = 0; j < array.length; j++) {
      newRow.push(array[j][i]);
    }
    transposedArray.push(newRow);
  }

  return transposedArray;
}


Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
  return this;
};

Array.prototype.myMap = function (callback) {
  let newArr = [];
  this.myEach( function(el)  {
    newArr.push(callback(el));
  });
  return newArr;
};



Array.prototype.myFancyMap = function (callback) {
  let newArr = [];
  this.myEach( function(el)  {
    newArr.push(callback(el));
  });
  return newArr;
};

let res = [1,2,3].myFancyMap(function (el) {
  return el * 2;
});

function addFive(el) {
  return el + 5;
}

// console.log(res);
// console.log([1,2,3].myFancyMap(addFive));


Array.prototype.myInject = function (callback) {
  let accumulator = this[0];
  this.slice(1).myEach( function(el) {
    accumulator = callback(accumulator, el);
  });
  return accumulator;
};

let res2 = [1,-9,5].myInject(function (accumulator, el) {
  return accumulator * el;
});


// console.log(res2);



Array.prototype.bubbleSort = function () {
  let sorted = false;
  while (!sorted) {
    sorted = true;
    for (let i = 0; i < this.length-1; i++) {
      if (this[i] > this[i+1]) {
        let temp = this[i];
        this[i] = this[i+1];
        this[i+1] = temp;
        sorted = false;
      }
    }
  }
  return this;
};

// console.log([4,3,2,1,5].bubbleSort());


String.prototype.subStrings = function () {
  let subStrings = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j <= this.length; j++) {
      subStrings.push(this.slice(i, j));
    }
  }

  return myUniq(subStrings);
};

// console.log("cat".subStrings());

function range(start, end) {
  if (start > end) {
    return [];
  }

  let arr = range(start+1, end);
  arr.unshift(start);
  return arr;
}

// console.log(range(3,6));

function exp1(base, num) {
  if (num === 0) {
    return 1;
  }

  return base * exp1(base, num - 1);
}

function exp2(base, num) {
  if (num === 0) {
    return 1;
  }
  else if (num === 1) {
    return base;
  }

  return (num % 2 === 0 ? (exp2(base, num/2) * exp2(base, num/2)) :
    (base * (exp2(base, (num - 1)/2) * (exp2(base, (num - 1)/2)))));
}

// console.log(exp2(4,3));

function fib(n) {
  if (n === 1) {
    return [1];
  }
  else if (n === 2) {
    return [1, 1];
  }

  let prevFib = fib(n - 1);
  prevFib.push(prevFib[prevFib.length-2] + prevFib[prevFib.length-1]);
  return prevFib;
}

// console.log(fib(10));


function binarySearch(array, target) {
  if (array.length === 1 && array[0] !== target)
    return -1;

  let halfIndex = Math.floor(array.length/2);
  if (array[halfIndex] === target) {
    return halfIndex;
  }

  let leftArray = array.slice(0, halfIndex);
  let rightArray = array.slice(halfIndex + 1);

  if (array[halfIndex] < target) {
    let sub = binarySearch(rightArray, target);
    return sub === -1 ? -1 : (halfIndex + 1 + binarySearch(rightArray, target));
  }
  else {
    return binarySearch(leftArray, target);
  }
}

// console.log(binarySearch([1, 3, 4, 5, 6], 3));

// function mergeSort(array) {
//
// }
//
// function merge()


function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function() {
  console.log(`${this.owner} loves ${this.name}`);
};

let c1 = new Cat("Anthony", "Eddie");
let c2 = new Cat("Bisous", "Linda");

// console.log(c1.cuteStatement());
// console.log(c2.cuteStatement());
//
// Cat.prototype.cuteStatement = function() {
//   console.log(`Everyone loves ${this.name}`);
// };
// console.log(c1.cuteStatement());
// console.log(c2.cuteStatement());

Cat.prototype.meow = function() {
  console.log(this.name + ' says meow!');
};

c1.meow();

c1.meow = function() {
  console.log("woof!");
};

c1.meow();
c2.meow();
