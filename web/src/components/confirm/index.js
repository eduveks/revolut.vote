import { h, Component } from 'preact';

import IconButton from 'preact-material-components/IconButton';
import 'preact-material-components/IconButton/style.css';

import Button from 'preact-material-components/Button';
import 'preact-material-components/Button/style.css';

import LayoutGrid from 'preact-material-components/LayoutGrid';
import 'preact-material-components/LayoutGrid/style.css';

import Submit from '../submit';

import Core from '../../core';

import Field from '../field';

import style from './style';

export default class Confirm extends Component {
    
    constructor(props) {
	super(props);
	this.state = {
	    voting: '',
	    locker: ''
	};
    }

    componentWillMount() {
	if (this.props.hash != ""
	    && this.props.hash.length == 11
	    && this.props.hash.indexOf('~') == 0) {
	    this.setState({
		voting: this.props.hash.substring(1)
	    });
	}
    }

    fieldChange = (field) => {
	const state = {};
	state['locker'] = field.value();
	this.setState(state);
    }

    fieldError = (field) => {
	console.log('fieldError');
	console.log(field.name());
    }

    send = (e) => {
	const isValid = Core.validate(this.fields);
	if (isValid == false) {
	    this.setState({ errorReason: Core.errorReason('code-validation') });
	    return;
	} else {
	    (async () => {
		const { voting, locker } = this.state;
		this.setState({ sending: true });
		Core.ajax({
		    service: 'confirmation',
		    data: {
			voting,
			locker
		    },
		    success: (data) => {
			if (data.result === true) {
                            this.setState({ success: true, sending: false });
			} else {
			    this.setState({ errorReason: Core.errorReason(data.error), sending: false });
			}
                    },
		    fail: () => {
			this.setState({ errorReason: Core.errorReason('connection'), sending: false });
                    }
		});
            })();
	}
    }

    render({}, { voting, locker, errorReason, sending, success }) {
	if (voting == null || voting == '') {
	    return (
		<section class="content">
		  <header class={ style.header }>
		    <h2>This link is invalid...</h2>
		    <p><a href="/">Home</a></p>
		  </header>
		</section>
	    );
	}
	this.fields = {};
	let alert = null;
	if (errorReason != '') {
	    alert = Submit.alert('fail', errorReason);
	}
	if (success) {
	    alert = Submit.alert('success', 'Submitted successfully! You votation is about to start and a vote request will be send to all participants.');
	}
	return (
	    <section class="content">
	      <header class={ style.header }>
		<h2>Confirmation</h2>
		<div>To start your voting please confirm with the code sent by <b>SMS</b> to your phone number.</div>
	      </header>
	      <div>
		<div class="field">
		  <Field
		    ref={ (code) => this.locker = code }
		    label="Code sent as SMS..."
		    name="code"
		    type="code"
		    required
		    value={ locker }
		    onChange={ this.fieldChange }
		    onError={ this.fieldError }
		    />
		</div>
		{ /*<p>All data is keeped with encryptation until you do your vote after that your information is automatically <b>deleted forever</b>.</p>*/ }
		<p>You will received a link to follow the voting results.</p>
	      </div>
	      <Submit alert={ alert } loading={ sending } send={ this.send } />
	    </section>
	);
    }
}
