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
