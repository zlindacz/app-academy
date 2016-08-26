export const pokemonConstants = {
  RECEIVE_ALL_POKEMON: 'RECEIVE_ALL_POKEMON',
  GET_ALL_POKEMON: 'GET_ALL_POKEMON'
};

export const receiveAllPokemon = (data) => ({
  type: pokemonConstants.RECEIVE_ALL_POKEMON,
  data
});

export const getAllPokemon = () => ({
  type: pokemonConstants.GET_ALL_POKEMON
});
