import { h, Component } from 'preact';

import $ from "jquery";

import TextField from 'preact-material-components/TextField';
import 'preact-material-components/TextField/style.css';

import Radio from 'preact-material-components/Radio';
import 'preact-material-components/Radio/style.css';

import Formfield from 'preact-material-components/Formfield';
import 'preact-material-components/Formfield/style.css';

import IconButton from 'preact-material-components/IconButton';
import 'preact-material-components/IconButton/style.css';

import Button from 'preact-material-components/Button';
import 'preact-material-components/Button/style.css';

import LayoutGrid from 'preact-material-components/LayoutGrid';
import 'preact-material-components/LayoutGrid/style.css';

import 'preact-material-components/List/style.css';

import Loading from '../loading';

import Submit from '../submit';

import Core from '../../core';

import style from './style';

export default class Vote extends Component {
    
    state = {
	voting: '',
	detail: null,
	option: '',
	loading: ''
    };

    constructor(props) {
	super(props);
    }

    componentWillMount() {
	if (this.props.hash != ""
	    && this.props.hash.length == 21
	    && this.props.hash.indexOf('@') == 10) {
	    const codes = this.props.hash.split('@');
	    this.setState({
		voting: codes[0],
		participant: codes[1],
		loading: true
	    });
	}
	if (this.state.voting != '') {
	    (async () => {
		const { voting, locker } = this.state;
		Core.ajax({
		    service: 'vote',
		    data: {
			voting
		    },
		    success: (data) => {
			if (typeof data.options != 'undefined' && $.isArray(data.options)) {
                            this.setState({ loading: false, detail: data });
			} else {
			    this.setState({ errorReason: Core.errorReason(data.error), loading: false });
			}
                    },
		    fail: () => {
			this.setState({ errorReason: Core.errorReason('connection'), loading: false });
                    }
		});
            })();
	}
    }

    optionChange = uid => {
	this.setState({
	    option: uid
	});
    }

    send = (e) => {
	if (this.state.option == '') {
	    this.setState({ errorReason: Core.errorReason('option-validation') });
	    return;
	} else {
	    (async () => {
		const { voting, participant, option } = this.state;
		this.setState({ sending: true });
		Core.ajax({
		    service: 'vote',
		    data: {
			voting,
			participant,
			option
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

    render({}, { voting, detail, errorReason, sending, success }) {
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
	if (detail == null) {
	    return <section class="content">
		<Loading/>
		</section>;
	}
	let alert = null;
        if (errorReason != '') {
            alert = Submit.alert('fail', errorReason);
        }
        if (success) {
            alert = Submit.alert('success', 'Submitted successfully! Please confirm your email or your mobile phone to start voting.');
        }
	const options = [];
	for (let i = 0; i < detail.options.length; i++) {
	    options.push(
		<li>
		  <Formfield>
		    <Radio
		      id={ `option-${i}` }
		      name={ `vote-option` }
		      value={ detail.options[i].uid }
		      onChange={this.optionChange.bind(undefined, detail.options[i].uid)}
		      />
		    <label for={ `option-${i}` }>{ detail.options[i].description }</label>
		  </Formfield>
		</li>
	    );
	}
	return (
	    <section class="content">
	      <header class={ style.header }>
		<h2>{ detail.title }</h2>
		<div>{ detail.description }</div>
	      </header>
	      <div>
		<div class="field">
		  <ul class={ style.options }>
		    { options }
		  </ul>
		</div>
		{ /*<p>All data is keeped with encryptation until you do your vote after that your information is automatically <b>deleted forever</b>.</p>*/ }
		<p>You will receive a link to follow the voting results.</p>
	      </div>
	      <Submit alert={ alert } loading={ sending } send={ this.send } />
	    </section>
	);
    }
}
