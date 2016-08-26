import * as ACTIONS from '../actions/pokemon_actions';
import { merge } from 'lodash';

export const pokemonReducer = (state = {}, action) => {
  switch (action.type) {
    case ACTIONS.pokemonConstants.RECEIVE_ALL_POKEMON:
      return merge({}, state, action.data);
    default:
      return state;
  }
};
