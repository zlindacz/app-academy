export const fetchAllPokemons = function(success) {
  $.ajax({
    url: '/api/pokemon',
    type: 'GET',
    success
  });
};

export const fetchOnePokemon = function(success, id) {
  $.ajax({
    url: `/api/pokemon/${id}`,
    type: 'GET',
    success
  });
};
