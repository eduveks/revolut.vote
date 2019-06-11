import { h, Component } from 'preact';

import Core from '../../core';

import Create from '../../components/create';
import Confirm from '../../components/confirm';
import Vote from '../../components/vote';
import Result from '../../components/result';

import style from './style';

export default class Votation extends Component {
    
    state = {
    };

    constructor(props) {
	super(props);
    }

    render({ hash }) {
	let content = <div/>;
	if (hash != null && hash != '') {
	    if (hash.indexOf('@') == 10) {
		content = <Vote hash={ hash }/>;
	    } else if (hash.indexOf('!') == 0) {
		content = <Result hash={ hash }/>;
	    } else if (hash.indexOf('~') == 0) {
		content = <Confirm hash={ hash }/>;
	    }
	}
	return (
	    <div class={`${style.home} page`}>
	      { /* url("/assets/banner_${ Core.random(1, 5) - 1 }.jpg */ }
	      <div class={ style.banner } style={ { backgroundImage: `url("/assets/banner.jpg")` } }/>
	      { content }
	    </div>
	);
    }
}
