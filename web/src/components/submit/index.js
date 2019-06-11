import { h, Component } from 'preact';

import Button from 'preact-material-components/Button';
import 'preact-material-components/Button/style.css';

import Loading from '../loading';

import style from './style';

export default class Submit extends Component {
    
    constructor(props) {
	super(props);
	this.state = { };
    }

    static alert(type, message) {
	return { type, message };
    }

    render({loading, send, alert}, {}) {
	if (loading) {
	    return <div><Loading/></div>;
	}
	return <div class={ style.submit }>
	    <div>{
		alert && alert.type == 'success' ?
		    null :
		    <Button type="button" raised dense onClick={ (e) => send(e) }>Send</Button>
	    }</div>
	    <div>{ alert ? <div data={ alert.type }>{ alert.message }</div> : null }</div>
	    </div>;
    }

}
