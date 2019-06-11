import { h, Component } from 'preact';

import Core from '../../core';

import style from './style';

export default class Footer extends Component {
    
    state = {
    };

    constructor() {
	super();
    }

    render() {
	return (
	    <footer class={ style.footer }>
	      <div class={style.sponsor}>
		<div class={ style.sponsorsContainer }>
		  <div class={ style.sponsorsLogosContainer }>
		    <div>
		      <a target="_blank" href="https://www.netuno.org">
			<img src="https://www.netuno.org/wp-content/uploads/2018/04/netunologolight_v4.svg" />
		      </a>
		    </div>
		    <div>
		      <a target="_blank" href="https://www.veks.net">
			<img class={ style.sponsorVeksLogo } src="https://www.veks.net/images/logo-light.svg" />
		      </a>
		    </div>
		  </div>
		  <div class={ style.source }>
		    Source code is here:
		    <p>
		      <a target="_blank" href="https://github.com/eduveks/revolut.vote">
			<img src="/assets/github-light.svg" /> GitHub
		      </a>
		    </p>
		    <div class={ style.author }>
		      created by
		      <p>
			<a target="_blank" href="https://www.eduardovelasques.com">eduardovelasques.com</a>
		      </p>
		    </div>
		  </div>
		</div>
	      </div>
	    </footer>
	);
    }
}
