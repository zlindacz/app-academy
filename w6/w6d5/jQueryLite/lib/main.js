const DomNodeCollection = require('./dom_node_collection.js');
let functionQueue = [];
let domLoaded = false;

window.addEventListener('DOMContentLoaded', () => {
  domLoaded = true;
  functionQueue.forEach ( func => {
    func();
  });
});

window.$l = function(arg) {
  if (typeof arg === 'string') {
    let nodes = document.querySelectorAll(arg);
    let nodesArray = Array.from(nodes);
    return new DomNodeCollection(nodesArray);
  } else if (typeof arg === 'object') {
    return new DomNodeCollection(arg);
  } else if (typeof arg === "function") {
    if (domLoaded) {
      arg();
    } else {
      functionQueue.push(arg);
    }
  }
};

window.$l.extend = function (...args) {
  let extendedObject = args[0];
  for (let index in args.slice(1)) {
    for (let attr in args[index]) {
      extendedObject[attr] = args[index][attr];
    }
  }
};

window.$l.ajax = function (...options) {
  let defaultOptions = { type: 'GET',
                     url: window.location.href,
                     contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                     success: (data) => {
                       console.log("success");
                       console.log(data);
                     },
                     error: () => {
                       console.error("you failed");
                     }

  };
  for (let attr in defaultOptions) {
    defaultOptions[attr] = options[attr];
  }

  const xhr = new XMLHttpRequest();

  xhr.open(defaultOptions.type, defaultOptions.url);

  xhr.onload = function() {
    return xhr;
  };

  if (typeof options.data !== "undefined") {
    const optionalData = options.data;
    xhr.send(optionalData);
  } else {
    xhr.send();
  }

};
//
// $.ajax({
//       type: 'GET',
//       url: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=bcb83c4b54aee8418983c2aff3073b3b",
//       success(data) {
//         console.log("We have your weather!")
//         console.log(data);
//       },
//       error() {
//         console.error("An error occurred.");
//       },
//    });
