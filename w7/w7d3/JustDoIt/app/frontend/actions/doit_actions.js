export const DOIT_ACTIONS = {
  REQUEST_DOITS: 'REQUEST_DOITS',
  RECEIVE_DOITS: 'RECEIVE_DOITS'
};

export const requestDoits = () => ({
  type: DOIT_ACTIONS.REQUEST_DOITS
});

export const receiveDoits = todos => ({
  type: DOIT_ACTIONS.RECEIVE_DOITS,
  todos
});
