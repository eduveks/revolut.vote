
import manifest from './manifest.json';

export default class Config {

    static apiURL(path) {
	return manifest.api_url + path;
    }
    
    static location() {
	return {
	    latitude: (38.707442).toFixed(6),
	    longitude: (-8.952609).toFixed(6)
	};
    }

    static appURL() {
	return {
	    googleMaps: 'comgooglemaps://?center='+ Config.location().latitude +','+ Config.location().longitude +'&zoom=14',
	    appleMaps: 'http://maps.apple.com/?sll='+ Config.location().latitude +','+ Config.location().longitude
	};
    }
}
