
import { h, Component } from 'preact';

import TextField from 'preact-material-components/TextField';
import 'preact-material-components/TextField/style.css';

import style from './style';

export default class Field extends Component {
    
    constructor(props) {
	if (!props.type) {
	    props.type = 'text';
	}
	super(props);
	this.state = {
	    value: props.value ? props.value : '',
	    error: false
	};
    }

    group() {
	return this.props.group;
    }

    name() {
	return this.props.name;
    }

    index() {
	return this.props.index;
    }

    type() {
	return this.props.type;
    }

    isTextarea() {
	return this.props.textarea;
    }

    required() {
	return this.props.required ? this.props.required : false;
    }

    value() {
	return this.state.value;
    }

    hasError() {
	return this.state.error;
    }

    setValue(value) {
	this.setState({
	    value
	});
    }

    validate = ()=> {
	const { value } = this.state;
	const { type, required, onError } = this.props;
	if ((required && value.trim() == '')
	    || (type == 'phone' && !/^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$/.test(value))
	    || (type == 'mail' && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value))
	   ) {
	    this.setState({
		error: true
	    });
	    if (onError) {
		console.log("onError");
		onError(this);
	    }
	    return false;
	} else {
	    this.setState({
		error: false
	    });
	    return true;
	}
    }

    change = (value) => {
	const { onChange } = this.props;
	this.setState({ value });
	this.validate();
	if (onChange) {
	    onChange(this);
	}
    }

    focus = () => {
	this.input.focus();
    }

    render({ key, type, name, label, textarea, required }, { value, error }) {
	const INPUT_TYPE = textarea ? 'textarea' : 'input';
	return (
	    <div class={ style.field } error={ error ? INPUT_TYPE : '' }>
	      <TextField
		ref={ (input) => this.input = input }
		autoComplete="off"
		fullWidth={ true }
		style={ {width: '100%'} }
		error={ error } 
		name={ name }
		label={ label } 
		value={ value }
		textarea={ textarea }
		required={ required }
		defaultValue={ value } 
		onKeyUp={ e => this.change(e.target.value) } 
		onChange={ e => this.change(e.target.value) } />
	    </div>
	);
    }

}
