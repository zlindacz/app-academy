import { DOIT_ACTIONS } from '../actions/doit_actions';
import { requestDoits } from '../actions/doit_actions';
import { receiveDoits } from '../actions/doit_actions';
import { fetchDoits } from '../util/doit_api_util';

const doitMiddleware = ({ getState, dispatch }) => next => action => {
  switch(action.type) {
    case DOIT_ACTIONS.REQUEST_DOITS:
      const success = data => {
        dispatch(receiveDoits());
      };
      const error = data => {
        console.log(data);
      };
      fetchDoits(success, error);
      break;
    default: next(action);
  }
};

export default doitMiddleware;
