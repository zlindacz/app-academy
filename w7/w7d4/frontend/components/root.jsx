import React from 'react';
import { Provider } from 'react-redux';
import PokemonIndexContainer from '../components/pokemon/pokemon_index_container';
import { Router, Route, hashHistory } from 'react-router';
import * as ACTIONS from '../actions/pokemon_actions';



const Root = ({store}) => {
  const getPokes = () => (store.dispatch(ACTIONS.getAllPokemon()));

  return (
    <Provider store={store}>
      <Router history={hashHistory}>
        <Route path="/" component={PokemonIndexContainer} onEnter={getPokes} />
      </Router>
    </Provider>
  );
};

export default Root;
