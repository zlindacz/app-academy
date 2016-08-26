import React from 'react';
import { withRouter } from 'react-router';

const _handleClick = (router, url) => (router.push(url));
const PokeDetails = ({pokemon, router}) => (
  <li
    className="pokemon-index-item"
    onCLick={_handleClick(router, `/pokemon/${pokemon.id}`)}>
    <span>{pokemon.id}</span>
    <img src={pokemon.image_url} alt={pokemon.name}/>
    <span>{pokemon.name}</span>
  </li>
);

export default withRouter(PokeDetails);
