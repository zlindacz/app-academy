import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      result: 0,
      num1: "",
      num2: ""
    };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1(event) {
    let value = event.target.value ? parseInt(event.target.value) : "";
    this.setState({num1: value})
  }


  setNum1(event) {
    let value = event.target.value ? parseInt(event.target.value) : "";
    this.setState({num1: value})
  }

  setNum2(event) {
    let value = event.target.value ? parseInt(event.target.value) : "";
    this.setState({num2: value})
  }

  add(event) {
    event.preventDefault;
    let newResult = parseInt(this.state.num1) +  parseInt(this.state.num2);
    this.setState({result: newResult});
  }

  subtract(event) {
    event.preventDefault;
    let newResult = parseInt(this.state.num1) -  parseInt(this.state.num2);
    this.setState({result: newResult});
  }

  multiply(event) {
    event.preventDefault;
    let newResult = parseInt(this.state.num1) * parseInt(this.state.num2);
    this.setState({result: newResult});
  }

  divide(event) {
    event.preventDefault;
    let newResult = parseInt(this.state.num1) /  parseInt(this.state.num2);
    this.setState({result: newResult});
  }

  clear(event) {
    event.preventDefault;
    this.setState({result: 0, num1: "", num2: ""});
  }

  render(){
    return(
      <div>
        <h1>{this.state.result}</h1>
        <input onChange={this.setNum1} value={this.state.num1}>
        </input>
        <input onChange={this.setNum2} value={this.state.num2}></input>
        <button onClick={this.clear}>Clear</button>

        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>

      </div>
    );
  }
}

export default Calculator;
