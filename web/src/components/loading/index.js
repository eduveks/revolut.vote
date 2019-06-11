import { h, Component } from 'preact';

import LinearProgress from 'preact-material-components/LinearProgress';
import 'preact-material-components/LinearProgress/style.css';

import style from './style';

export default class Loading extends Component {
    
    constructor(props) {
	super(props);
	this.state = { };
    }

    render({}, {}) {
	return <div><LinearProgress indeterminate /></div>;
    }

}
