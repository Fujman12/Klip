var static = require('node-static'),
	file = new static.Server('./docs');

require('http').createServer(function(req, res) {
	req.addListener('end', function() {
		file.serve(req, res);
	}).resume();
}).listen(5000);

console.log('Development Server listening on 5000');