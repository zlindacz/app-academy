import React from 'react';
import PokeDetails from './pokemon_index_item';

const PokemonIndex = (props) => {
  const pokeList = Object.keys(props.allPokemon).map((key) => (
    <PokeDetails pokemon={props.allPokemon[key]} key={key} />
  ));

  return (
    <div>
      <ul>{pokeList}</ul>
    </div>
  );
};

export default PokemonIndex;
