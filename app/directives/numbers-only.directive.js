app
	.directive('numbersOnly',NumbersOnlyService)

	function NumbersOnlyService() {
		return {
	        require: 'ngModel',
	        link: function (scope, element, attrs, ctrl) {
	        	
	            var validateNumber = function (inputValue) 
	            {
	                var maxLength = parseInt(attrs.maxlength);
	                if (attrs.max) {
	                    maxLength = attrs.max;
	                }
	                if (inputValue === undefined) {
	                    return '';
	                }
	                var transformedInput = inputValue.replace(/[^0-9]/g, '');
	                if (transformedInput !== inputValue) {
	                    ctrl.$setViewValue(transformedInput);
	                    ctrl.$render();
	                }
	                if (transformedInput.length > maxLength) {
	                    transformedInput = transformedInput.substring(0, maxLength);
	                    ctrl.$setViewValue(transformedInput);
	                    ctrl.$render();
	                }
	                
	                return transformedInput;
	            };
	            ctrl.$parsers.unshift(validateNumber);
	            ctrl.$parsers.push(validateNumber);
	            attrs.$observe('notEmpty', function () {
	                validateNumber(ctrl.$viewValue);
	            });
	        }
	    };
	}