/* global angular */

(function() {
  angular.module("app").controller("notepage", function($scope, $http, $timeout) {
    $scope.setup = function() {
      $http.get('/notes.json').then(function(response) {
        $scope.notes = response.data;
      });
    };

    $scope.noteText = {};
      var timeout = null;
      var saveUpdates = function() {
          $http.post('/notes.json', noteText).then(function(response) {
            console.log(response);
            $scope.incidents.push(noteText);
          }, function(error) {
            console.log(error);
            $scope.errors = error.data.errors;
          });
      };
      var debounceSaveUpdates = function(newVal, oldVal) {
        if (newVal != oldVal) {
          if (timeout) {
            $timeout.cancel(timeout);
          }
          timeout = $timeout(saveUpdates, 1000);
        }
      };

      $scope.$watch('noteText.text', debounceSaveUpdates);
      $scope.$watch('noteText.note_page_id', debounceSaveUpdates);
        window.$scope = $scope;

  });
})();