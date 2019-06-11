import { h, Component } from 'preact';

import linkState from 'linkstate';

import TextField from 'preact-material-components/TextField';
import 'preact-material-components/TextField/style.css';

import Card from 'preact-material-components/Card';
import 'preact-material-components/Card/style.css';

import IconButton from 'preact-material-components/IconButton';
import 'preact-material-components/IconButton/style.css';

import Button from 'preact-material-components/Button';
import 'preact-material-components/Button/style.css';

import LayoutGrid from 'preact-material-components/LayoutGrid';
import 'preact-material-components/LayoutGrid/style.css';

import $ from 'jquery';

import Field from '../field';

import Submit from '../submit';

import Config from '../../config';

import Core from '../../core';

import style from './style';

export default class Create extends Component {
    
    constructor() {
	super();
	this.state = {
	    title: '',
	    description: '',
	    options: [ 'Yes', 'No' ],
	    participants: [ { phone: '', mail: '' } ],
	    mail: '',
	    phone: '',
	    sending: false,
	    success: false,
	    error: false,
	    errorReason: ''
	};
    }

    componentDidUpdate() {
	console.log('UPDATE');
    }

    addOption = e => {
	const { options } = this.state;
	options.push('');
	this.setState({
	    options
	});
    }

    removeOption = (i, e) => {
	const { options } = this.state;
	options.splice(i, 1);
	this.setState({
	    options
	});
    }

    changeOption = (i, value, e) => {
	const { options } = this.state;
	options[i] = value;
	this.setState({
	    options
	});
    }

    addParticipant = e => {
	const { participants } = this.state;
	participants.push({ phone: '', mail: '', error: false });
	this.setState({
	    participants
	});
    }

    removeParticipant = (i, e) => {
	const { participants } = this.state;
	participants.splice(i, 1);
	this.setState({
	    participants
	});
    }

    changeParticipant = (i, key, value, e) => {
	const { participants } = this.state;
	participants[i][key] = value;
	this.setState({
	    participants
	});
    }

    fieldChange = (field) => {
	const state = {};
	if (field.group() == 'options') {
	    this.state.options[field.index()] = field.value();
	    state['options'] = this.state.options;
	} else if (field.group() == 'participants') {
	    this.state.participants[field.index()][field.name()] = field.value();
	    state['participants'] = this.state.participants;
	} else {
	    state[field.name()] = field.value();
	}
	this.setState(state);
    }

    fieldError = (field) => {
	console.log('fieldError');
	console.log(field.name());
    }

    send = e => {
	let firstInvalidField = null;
	let data = {};
	const isValid = Core.validate(this.fields);
	if (isValid == false) {
	    //firstInvalidField.focus();
	    //alert('Not filled correctly.');
	    //setTimeout(()=> {
		//window.scrollTo(0, window.scrollTop - 50);
		//document.activeElement.blur();
	    //}, 1000);
	    this.setState({ errorReason: Core.errorReason('fields-validation') });
	    return;
	} else {
	    (async () => {
		const { title, description, phone, mail, options, participants } = this.state;
		this.setState({ sending: true });
		Core.ajax({
		    service: 'create',
		    data: {
			title: title,
			description: description,
			phone: phone,
			mail: mail,
			options: options,
			participants: participants
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

    render({}, { title, description, options, participants, mail, phone, errorReason, sending, success }) {
	this.fields = {};
	this.fields.options = [];
	this.fields.participants = [];
	let alert = null;
	if (options.length < 2) {
	    alert = Submit.alert('fail', 'Need at least 2 options of vote.');
	} else if (participants.length < 1) {
	    alert = Submit.alert('fail', 'Need at least 1 participant.');
	}
	if (errorReason != '') {
	    alert = Submit.alert('fail', errorReason);
	}
	if (success) {
	    alert = Submit.alert('success', 'Submitted successfully! Please confirm your email or your mobile phone to start voting.');
	}
	const elementsOptions = [];
	options.forEach((option, i) => {
	     this.fields.options.push(null);
	     elementsOptions.push(
		 <li>
		   <div>
		     <Field	
		       ref={ (option) => this.fields.options[i] = option }
		       label={ `Option ${ i + 1 }...` }
		       group="options"
		       index={ i }
		       required
		       value={ option }
		       onChange={ this.fieldChange }
		       onError={ this.fieldError }
		       />
		   </div>
                   <div>
		     { options.length > 2 ?
		       <IconButton type="button" on onClick={ e => this.removeOption(i, e) }>
		         <IconButton.Icon on>remove_forever</IconButton.Icon>
		         <IconButton.Icon>remove_forever</IconButton.Icon>
		       </IconButton>
		     : null }
		   </div>
		 </li>
	     );
	});
	const elementsParticipants = [];
	participants.forEach((participant, i) => {
	    this.fields.participants.push({ phone: null, mail: null });
	    elementsParticipants.push(
		<li>
		  <div>
		    <Field
		      ref={ (phone) => this.fields.participants[i].phone = phone }
		      label={ `Phone ${ i + 1 } ...` }
		      type="phone"
		      group="participants"
		      name="phone"
		      index={ i }
		      required
		      value={ participant.phone }
		      onChange={ this.fieldChange }
		      onError={ this.fieldError }
		      />
		  </div>
		  <div>
		    <Field
		      ref={ (mail) => this.fields.participants[i].mail = mail }
		      label={ `Mail ${ i + 1 }...` }
		      type="mail"
		      group="participants"
		      name="mail"
		      index={ i }
		      required
		      value={ participant.phone }
		      onChange={ this.fieldChange }
		      onError={ this.fieldError }
		      />
		  </div>
		  <div>
		    { participants.length > 1 ?
		      <IconButton type="button" on onClick={ e => this.removeParticipant(i, e) }>
		        <IconButton.Icon on>remove_forever</IconButton.Icon>
		        <IconButton.Icon>remove_forever</IconButton.Icon>
		      </IconButton>
		    : null }
		  </div>
		</li>
	    );
	});
	return (
	    <section class="content">
	      <header class={ style.header }>
		<h2>Create a new Votation</h2>
		<div>
		  <p>Fill your question, and your reply options, and fill too the list of contacts of who can vote.</p>
		  <p>With this, we will send to phone numbers and emails a vote invite and eventually, they will start voting anonymously.</p>
		  <p>The results will be available to everyone that participated through voting.</p>
		  <p>Let's start build your custom votation!</p>
		</div>
	      </header>
	      <form ref={ (form) => this.form = form } autocomplete="off">
		<div class="field">
		  <Field
		    ref={ (title) => this.fields.title = title }
		    label="Title..."
		    name="title"
		    required
		    value={ title }
		    onChange={ this.fieldChange }
		    onError={ this.fieldError } />
		</div>
		<div class="field">
		  <Field
		    ref={ (description) => this.fields.description = description }
		    textarea={true}
		    label="Description or question here..."
		    name="description"
		    required
		    onChange={ this.fieldChange }
		    onError={ this.fieldError } />
		</div>
		<div class="field">
		  <h4>Options to Vote</h4>
		  <section class={ style.options }>
		    <ul>
		      { elementsOptions }
		    </ul>
		    <footer>
		      <IconButton type="button" on onClick={ this.addOption }>
			<IconButton.Icon on>add</IconButton.Icon>
			<IconButton.Icon>add</IconButton.Icon>
		      </IconButton>
	            </footer>
	          </section>
		</div>
		<p>Your mail and phone number is required to validate that you are a real person and to send the voting results.</p>
		{ /*<p>All data is keeped with encryptation until you validate after that your information is automatically <b>deleted forever</b>.</p> */ }
		<p>You will receive a link to follow the votation and check the results.</p>
		<div class="field">
		  <section class={ style.participants }>
		    <h4>List of the Participants</h4>
		    <ul>
		      { elementsParticipants }
		    </ul>
		    <footer>
		      <IconButton type="button" on onClick={ this.addParticipant }>
			<IconButton.Icon on>add</IconButton.Icon>
			<IconButton.Icon>add</IconButton.Icon>
		      </IconButton>
	            </footer>
	          </section>
		</div>
		<div class="field">
		  <Field
		    ref={ (mail) => this.fields.mail = mail }
		    label="Mail"
		    name="mail"
		    type="mail"
		    required
		    value={ mail }
		    onChange={ this.fieldChange }
		    onError={ this.fieldError }
		    />
		</div>
		<p>You will receive a SMS with a code to validate:</p>
		<div class="field">
		  <Field
		    ref={ (phone) => this.fields.phone = phone }
		    label="Phone"
		    name="phone"
		    type="phone"
		    required
		    value={ phone }
		    onChange={ this.fieldChange }
		    onError={ this.fieldError }
		    />
		</div>
	      </form>
	      <Submit alert={ alert } loading={ sending } send={ this.send } />
	    </section>
	);
    }
}
