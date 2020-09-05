import React from 'react';

class Tab extends React.Component {

    constructor(props) {
        super(props);
        // this.food = this.props.banana;
        this.state = {selected: 0};

    }

    selectedTab() {
        this.setState({selected: num});
    }

    render() {
        return (
            <div>
                <h1>TAB</h1>
                {/* <p>{this.food}</p> */}
            </div>
            )
    }

}

export default Tab;