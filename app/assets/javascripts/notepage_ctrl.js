/* global angular */

(function() {
  angular.module("app").controller("notepage", function($scope, $http, $timeout) {

    $scope.noteText = {};
      var timeout = null;
      var saveUpdates = function() {
        // .... save data to server
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