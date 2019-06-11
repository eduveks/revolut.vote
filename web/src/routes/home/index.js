import { h, Component } from 'preact';

import Core from '../../core';

import Create from '../../components/create';

import style from './style';

export default class Home extends Component {
    
    state = {
    };

    constructor() {
	super();
    }

    render() {
	return (
	    <div class={`${style.home} page`}>
	      { /* url("/assets/banner_${ Core.random(1, 5) - 1 }.jpg */ }
	      <div class={ style.banner } style={ { backgroundImage: `url("/assets/banner.jpg")` } }/>
	      <Create/>
	    </div>
	);
    }
}
