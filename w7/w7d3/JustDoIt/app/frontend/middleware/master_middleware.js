import { applyMiddleware } from 'redux';
import doitMiddleware from './doit_middleware';

const MasterMiddleware = applyMiddleware(doitMiddleware);

export default MasterMiddleware;
