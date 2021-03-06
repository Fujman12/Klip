var App = (function () {
	'use strict';

	App.formEditable = function( ){
		//toggle `popup` / `inline` mode
		$.fn.editable.defaults.mode = 'popup';     
		
		//make username editable
		
		//make username editable
		// $('#email-address').editable({
		// 	validate: function(value) {
		// 		if($.trim(value) == '') {
		// 				return 'This field is required';
		// 		}
		// 	}
		// });
			
		//make username editable

		//make group editable

		//make status editable
		$('#status').editable({
				type: 'select',
				title: 'Select status',
				placement: 'top',
				value: 2,
				source: [
						{value: 1, text: 'status 1'},
						{value: 2, text: 'status 2'},
						{value: 3, text: 'status 3'}
				]
		});

		//make dob editable
		$('#dob').editable({
			format: 'dd-mm-yyyy',
			viewformat: 'dd/mm/yyyy',
			datepicker: {
				weekStart: 1
			}
		});

		//make event editable
		$('#username,#email-address,#password,#street-address,#apt-unit-no,#city,#state,#address, #zip-code,#phone-number,#dispensary-name,#first-name,#last-name,#website,#business-email,#business-phone,#points').editable({
			 placement: 'top',
		});

		// $('#category').editable({
		// 	showbuttons: false,
		// 	source: [
		// 		{value: 1, text: 'Indica'},
		// 		{value: 2, text: 'Sativa'},
		// 		{value: 3, text: 'Hybrid'},
		// 		{value: 4, text: 'CBD'},
		// 		{value: 5, text: 'Concentrates'}
		// 	]
		// });

		//make comments editable
		$('#comments').editable({
			showbuttons: 'bottom'
		});
			
		//make state2 editable
		$('#state2').editable({
			value: 'California',
			typeahead: {
				name: 'state',
				local: ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]
			}
		});

		//make fruits editable
		$('#fruits').editable({
			pk: 1,
			limit: 3,
			source: [
				{value: 1, text: 'banana'},
				{value: 2, text: 'peach'},
				{value: 3, text: 'apple'},
				{value: 4, text: 'watermelon'},
				{value: 5, text: 'orange'}
			]
		});
	};

	return App;
})(App || {});