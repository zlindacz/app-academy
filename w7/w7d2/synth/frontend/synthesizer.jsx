import React from 'react';
import ReactDOM from 'react-dom';
import store from './store/store';
import Root from './components/root';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById('root');
  // console.log(Root({ store }))

  ReactDOM.render(Root({ store }), root);
});
