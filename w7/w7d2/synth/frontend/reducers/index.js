import { combineReducers } from 'redux';
import notes from './notes_reducer';
import tracks from './tracks_reducer';
import isRecording from './is_recording_reducer';

export default combineReducers({
  notes,
  tracks,
  isRecording
});
