import React from 'react';
import ReactDOM from 'react-dom';
import { applyMiddleware } from 'redux';

import configureStore from './store/store';
import Root from './components/root';
import { applyMiddleware } from 'redux';

document.addEventListener('DOMContentLoaded', function() {
  const store = configureStore();
  const rootEl = document.getElementById('root');
  const newStore = applyMiddlewares(store, addLoggingToDispatch);
  ReactDOM.render(<Root store={newStore} />, rootEl);
});

const addLoggingToDispatch = (store) => (next) => (action) => {
  const dispatch = store.dispatch;
  return (action) => {
    console.log(store.getState());
    console.log(action);
    store.dispatch(action);
    console.log(store.getState());
  };
};

const applyMiddlewares = (store, ...middlewares) => {
  const dispatch = store.dispatch;
  middlewares.forEach(ware => {
    dispatch = middleware(store)(dispatch);
  });
  return Object.assign({}, store, { dispatch} }
}
