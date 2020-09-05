import React from 'react';

class Clock extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            time: new Date()
        };
        this.tick = this.tick.bind(this)
    }

    tick() {
        this.setState({time: new Date()});
    }

    componentDidMount() {
        this.interval = setInterval(this.tick, 1000);
    }

    componentWillUnmount() {
        clearInterval(this.interval)
    }

    render() {
        const theTime = this.state.time;

        return (
            <div>
                <h1>CLOCK</h1>
                <p>{theTime.getHours()}:{theTime.getMinutes()}:{theTime.getSeconds()}</p>
            </div>
        )
    }

}

export default Clock;