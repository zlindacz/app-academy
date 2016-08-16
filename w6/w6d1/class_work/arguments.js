function sum() {
  let args = Array.from(arguments);
  let total = 0;
  args.forEach(el => {
    total += el;
  });
  return total;
}
// console.log(sum(1, 2, 3));

function sumRest(...args) {
  let total = 0;
  args.forEach(el => {
    total += el;
  });
  return total;
}
// console.log(sum(1, 2, 3, 4));


class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

Function.prototype.myBind = function(context) {
  let args = Array.from(arguments).slice(1);
  let scope = this;
  return function() {
    let args2 = Array.from(arguments);
    scope.apply(context, args.concat(args2));
  };
};

// Function.prototype.myBind = function(context, ...args) {
//   let scope = this;
//   return (...args2) => {
//     scope.apply(context, args.concat(args2));
//   };
// };

// markov.says("meow", "Ned");
// markov.says.myBind(breakfast, "meow", "Kush")();
// markov.says.myBind(breakfast)("meow", "a tree");
// markov.says.myBind(breakfast, "meow")("Markov");
//
// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");

function curriedSum(numArgs) {
  let numbers = [];
  function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return sum(...numbers);
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

// const currySum = curriedSum(4);
// console.log(currySum(5)(30)(20)(1)); // => 56

Function.prototype.curry = function(numArgs) {
  let args = [];
  let scope = this;
  function _curriedFunc(el) {
    args.push(el);
    if (args.length === numArgs) {
      return scope.apply(scope, args);
    } else {
      return _curriedFunc;
    }
  }
  return _curriedFunc;
};

console.log(sum.curry(2)(3)(4));
console.log(curriedSum.curry(3)(4)(1)(1)(2)(9));


// Function.prototype.curry = function(numArgs) {
//   let args = [];
//   let scope = this;
//   function _curriedFunc(el) {
//     args.push(el);
//     if (args.length === numArgs) {
//       return scope.call(scope, ...args);
//     } else {
//       return _curriedFunc;
//     }
//   }
//   return _curriedFunc;
// };

// console.log(sum.curry(3)(3)(4)(2));
