 import React from 'react';
 import ReactDOM from 'react-dom';
 import configureStore from './store/store';
 import allDoits from './reducers/selector';
 import { requestDoits } from './actions/doit_actions';
 import { receiveDoits } from './actions/doit_actions';
 import { DOIT_ACTIONS } from './actions/doit_actions';
 import { fetchDoits } from './util/doit_api_util';

 document.addEventListener("DOMContentLoaded", () => {
   const content = document.getElementById('content');
   ReactDOM.render(<div>IT WORKED</div>, content);
 });
 window.store = configureStore();
 window.allDoits = allDoits(window.store.getState());
 window.requestDoits = requestDoits;
 window.fetchDoits = fetchDoits;
