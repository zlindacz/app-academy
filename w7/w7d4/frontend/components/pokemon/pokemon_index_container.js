import { connect } from 'react-redux';
import PokemonIndex from './pokemon_index';
import {getAllPokemon} from '../../actions/pokemon_actions';

const mapStateToProps = state => ({
  allPokemon: state
});

export default connect(
  mapStateToProps,
  null
)(PokemonIndex);
