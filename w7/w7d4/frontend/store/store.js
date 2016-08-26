import {createStore, applyMiddleware } from 'redux';
import { pokemonReducer } from '../reducers/pokemon_reducer';
import pokemonMiddleware from '../middleware/pokemon_middleware';

const configureStore = () => (
  createStore(pokemonReducer, applyMiddleware(pokemonMiddleware))
);

export default configureStore;
