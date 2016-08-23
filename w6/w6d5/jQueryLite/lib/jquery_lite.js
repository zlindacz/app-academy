/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const DomNodeCollection = __webpack_require__(1);
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


/***/ },
/* 1 */
/***/ function(module, exports) {

	class DomNodeCollection {
	  constructor(arr) {
	    this.elements = Array.from(arr);
	  }

	  each(cb) {
	    this.elements.forEach(cb);
	  }

	  html(str) {
	    if(typeof str !== 'undefined') {
	      this.each( el => {
	        el.innerHTML = str;
	      });
	    } else {
	      return this.elements[0].innerHTML;
	    }
	  }

	  empty() {
	    this.html('');
	  }

	  append(children) {
	    this.each( el => {
	      children.forEach(child => {
	        el.innerHTML += child;
	      });
	    });
	  }

	  attr(attribute, value) {
	    this.each(el => {
	      if(typeof value === "undefined") {
	        return el.getAttribute(attribute);
	      } else {
	        el.setAttribute(attribute, value);
	      }
	    });
	  }

	  addClass(aClass) {
	    this.each(el => {
	      el.className = aClass;
	    });
	  }

	  removeClass(aClass) {
	    this.each(el => {
	      el.className.replace(/\b${aClass}\b/, '');
	    });
	  }

	  children() {
	    let allChildren = [];
	    this.each(el => {
	      allChildren.push(el.children);
	    });
	    return new DomNodeCollection(allChildren);
	  }

	  parent() {
	    let allParents = [];
	    this.each(el => {
	      allParents.push(el.parent);
	    });
	    return new DomNodeCollection(allParents);
	  }

	  find(selector, descents) {
	    let allDescendents = [];
	    if(typeof descents !== 'undefined') {
	      allDescendents = descents;
	    }
	    this.each(el => {
	      if (el.children.length > 0) {
	        allDescendents.push(el.children);
	        el.children.forEarch(e => e.find(selector, allDescendents));
	      } else {
	        return allDescendents;
	      }
	    });
	    // use querySelectorAll you dumb dumb
	  }

	  remove() {
	    this.each( el => {
	      el.innerHTML = '';
	      el.outerHTML = '';
	    });
	    this.elements = [];
	  }

	  on(evt, callback) {
	    this.each( el => {
	      el.addEventListener(evt, callback);
	    });
	  }

	  off(evt) {
	    this.each( el => {
	      el.removeEventListener(evt);
	    });
	  }
	}

	module.exports = DomNodeCollection;


/***/ }
/******/ ]);