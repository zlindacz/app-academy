import React from 'react';

class BenchIndex extends React.Component {
  componentDidMount() {
    const benches = this.props.benches;
  }

  render() {
    const description = benches.map((bench) => {
      return (<p>{bench.description}</p>)
    });

    return(
      <div>
        { description };
      </div>
    );
  }
}
