import * as API from '../utils/api_utils';
import * as ACTIONS from '../actions/pokemon_actions';

export default ({ dispatch }) => next => action => {
  const fetchSuccess = data => dispatch(ACTIONS.receiveAllPokemon(data));
  switch (action.type) {
    case ACTIONS.pokemonConstants.GET_ALL_POKEMON:
      API.fetchAllPokemons(fetchSuccess);
      break;
    // case ACTIONS.pokemonConstants.RECEIVE_ALL_POKEMON:
    //   next(action);
    default:
      next(action);

  }
  // middlware switch statement and necessary variables
};
