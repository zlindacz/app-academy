import { NotesConstants } from '../actions/notes_actions';
import { NOTES_NAMES } from '../utility/tones';

const keyMap = {
  'A': NOTES_NAMES[0],
  'S': NOTES_NAMES[1],
  'D': NOTES_NAMES[2],
  'F': NOTES_NAMES[3],
  'G': NOTES_NAMES[4]
};

const validKeys = Object.keys(keyMap);

export default (state = [], action) => {
  switch (action.type) {
    case NotesConstants.KEY_PRESSED:
      if (validKeys.includes(action.key) && !state.includes(keyMap[action.key])) {
        return [
          ...state,
          keyMap[action.key]
        ];
      } else {
        return state;
      }
    case NotesConstants.KEY_RELEASED:
      if (state.includes(keyMap[action.key])) {
        let idx = state.indexOf(keyMap[action.key]);
        return [
          ...state.slice(0, idx),
          ...state.slice(idx + 1)
        ];
      } else {
        return state;
      }
    default:
      return state;
  }
};
