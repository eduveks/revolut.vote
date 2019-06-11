import { h, Component } from 'preact';

import $ from "jquery";

import LayoutGrid from 'preact-material-components/LayoutGrid';
import 'preact-material-components/LayoutGrid/style.css';

import Loading from '../loading';

import Core from '../../core';

import style from './style';

export default class Result extends Component {
    
    constructor(props) {
	super(props);
	this.state = {
	    invalidLink: false,
	    voting: '',
	    detail: null,
	    loading: false
	};
    }
    
    componentWillMount() {
	if (this.props.hash != ""
	    && this.props.hash.length == 11
	    && this.props.hash.indexOf('!') == 0) {
	    this.setState({
		voting: this.props.hash.substring(1),
		loading: true
	    });
	} else {
	    this.setState({ invalidLink: true })
	}
	if (this.state.voting != '') {
	    (async () => {
		const { voting } = this.state;
		Core.ajax({
		    service: 'result',
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

    render({}, { invalidLink, voting, detail, loading }) {
	if (invalidLink) {
	    return (
		<section class="content">
		  <header class={ style.header }>
		    <h2>This link is invalid...</h2>
		    <p><a href="/">Home</a></p>
		  </header>
		</section>
	    );
	}
	if (loading) {
	    return <section class="content">
		<Loading/>
		</section>;
	}
	if (detail == null) {
	    return (
		<section class="content">
		  <header class={ style.header }>
		    <h2>Sorry, we had a problem. Please try again later.</h2>
		    <p><a href="/">Home</a></p>
		  </header>
		</section>
	    );
	}
	let options = [];
	for (let i = 0; i < detail.options.length; i++) {
	    const option = detail.options[i];
	    options.push(
		<li>
		  <h4>{ option.description }</h4>
		  <p>{ option.total }</p>
		</li>
	    );
	}
	return (
	    <section class="content">
	      <header class={ style.header }>
		<h2>{ detail.voting.title }</h2>
		<div>{ detail.voting.description }</div>
	      </header>
	      <div>
		<ul class={ style.options }>
		  { options }
		</ul>
	      </div>
	      <div>
		<p>Above shows the voting results.</p>
	      </div>
	    </section>
	);
    }
}
