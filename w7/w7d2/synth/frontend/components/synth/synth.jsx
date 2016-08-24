import React from 'react';
import { NOTES_NAMES, TONES } from '../../utility/tones';
import Note from '../../utility/note';
import $ from 'jquery';

class Synth extends React.Component {
  constructor () {
    super();
    this.notes = {};
    for (let key in TONES) {
      let freq = TONES[key];
      this.notes[key] = new Note(freq);
    }
  }

  componentDidMount() {
    $(document).on('keydown', e => this.onKeyDown(e));
    $(document).on('keyup', e => this.onKeyUp(e));
  }

  onKeyDown(e) {
    let key = String.fromCharCode(e.keyCode);
    this.props.keyPressed(key);
  }

  onKeyUp(e) {
    let key = String.fromCharCode(e.keyCode);
    this.props.keyReleased(key);
  }

  playNotes() {
    console.log(this.props.notes);
    for (let key in this.notes) {
      if (this.props.notes.includes(key)) {
        this.notes[key].start();
      } else {
        this.notes[key].stop();
      }
    }
  }

  render () {
    this.playNotes();
    const notes = [];
    for (let key in this.notes) {
      notes.push(<li key={ key }>note</li>);
    }

    return (
      <div>
        <h1>Synth</h1>
        <ul>
          {notes}
        </ul>
      </div>
    );
  }
}

export default Synth;
