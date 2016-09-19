import { BenchConstants } from '../actions/bench_actions';
import merge from 'lodash/merge';

const BenchesReducer = (state={}, action) => {
  switch(action.type) {
    case BenchConstants.RECEIVE_BENCHES:
      merge({}, state, action.data)
      return next(action);
    default:
      return state
  }
}

export default BenchesReducer;
