import _ from 'lodash';
import { TracksConstants } from '../actions/tracks_actions';

export default (state={}, action) => {
  let id;
  let newState;
  switch (action.type) {
    case TracksConstants.START_RECORDING:
      id = Object.keys(state).length + 1;
      let name = `Track ${id}`;

      newState = _.merge({}, state);
      newState[id] = {
        id, name,
        roll: [],
        timeStart: action.timeNow
      };

      return newState;
    case TracksConstants.STOP_RECORDING:
      action.notes = [];
    case TracksConstants.ADD_NOTES:
      id = Object.keys(state).length;
      let timeSlice = action.timeNow - state[id].timeStart;

      let roll = {
        notes: action.notes,
        timeSlice
      };

      newState = _.merge({}, state);
      newState[id].roll.push(roll);
      return newState;
    default: return state;
  }
};
