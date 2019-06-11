
import Config from './config';
import Field from './components/field';
export default class Core {

    static validate(fields) {
	let isValid = true;
	const validate = (fields) => {
	    for (const key in fields) {
		const field = fields[key];
		if (field instanceof Field) {
		    if (field.validate() == false) {
			//if (firstInvalidField == null) {
			    //firstInvalidField = field;
			//}
			isValid = false;
		    }
		} else if (field instanceof Array
			   || field instanceof Object) {
		    validate(field);
		}
	    }
	};
	validate(fields);
	return isValid;
    }
    
    static ajax(options) {
	const { service, data, success, fail } = options;
	fetch(Config.apiURL(service +'.netuno'), {
	    method: 'POST',
	    mode: 'cors',
	    cache: 'no-cache',
	    credentials: 'same-origin',
	    headers: {
		'Content-Type': 'application/json'
	    },
	    redirect: 'follow',
	    referrer: 'no-referrer',
	    body: JSON.stringify(data)
	})
	    .then(response => response.json())
	    .then(success)
	    .catch(fail);

    }

    static isMobile() {
	return /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);
	//return true;
    }

    static shuffle(arr) {
	return arr
	    .map(a => [Math.random(), a])
	    .sort((a, b) => a[0] - b[0])
	    .map(a => a[1]);
    }

    static random(mini, maxi) {
	return Math.ceil(Math.exp(Math.random()*(Math.log(maxi)-Math.log(mini)))*mini);
    }

    static randomSAL() {
	const animations = [
	    'slide-up',
	    'slide-down',
	];
	return animations[Math.floor(Math.random() * animations.length)];
    }

    static validateMail(mail) {
	var re = /\S+@\S+\.\S+/;
	return re.test(mail);
    }

    static errorReason(code) {
	let reason = '';
	if (code == 'bad-request') {
	    reason = 'Sorry, the request is invalid.';
	} else if (code == 'invalid-data') {
	    reason = 'Sorry, the submitted data was not accepted.';
	} else if (code == 'invalid-data-owner') {
	    reason = 'Sorry, this code was not accepted.';
	} else if (code == 'already-voted') {
	    reason = 'You already vote, thank you.';
	} else if (code == 'connection') {
	    reason = 'Sorry, there was a connection failure! Please try again later.';
	} else if (code == 'code-validation') {
	    reason = 'Please check if the code field is filled up.';
	} else if (code == 'fields-validation') {
	    reason = 'Please check if all fields are filled up, something is wrong.';
	} else if (code == 'option-validation') {
            reason = 'Please select an option to vote.';
        }
	return reason;
    }
}
