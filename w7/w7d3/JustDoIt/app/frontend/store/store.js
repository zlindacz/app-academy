import { createStore } from 'redux';
import reducer from '../reducers/root_reducer';
import middleware from '../middleware/master_middleware';

const configureStore = () => (createStore(reducer, middleware));

export default configureStore;
