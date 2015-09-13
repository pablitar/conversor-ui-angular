/**
 * 
 */

var conversorApp = angular.module('conversorApp',[]);

conversorApp.controller('conversorCtrl', ['$http', '$scope', function($http, $scope) {
	$scope.millas = 0.0;
	$scope.km = 0.0;
	
	$scope.convertir = function() {
	  var promesa = $http.get('/convertir/' + $scope.millas);
	  promesa.success(function(respuestaJSON){
	    $scope.km = respuestaJSON.km;
	  });
	  
	  promesa.error(function(error) {
	    $scope.error = error.errorMessage;
	  });
	};
}]);