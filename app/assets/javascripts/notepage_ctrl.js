/* global angular */

(function() {
  angular.module("app").controller("notepage", function($scope, $http) {

    $scope.editNotes = function(inputText, noteObject) {
      noteObject.text = inputText;
      var url = '/notes/' + noteObject.id;
      $http.patch(url, noteObject).then(function(
        response) {
        console.log(response);
      }, function(error) {
        console.log(error);
        $scope.errors = error.data.errors;
      });
    };

    $scope.autoSave = setInterval(function() {
      var form = $('#text');
      var method = form.attr('patch').toLowerCase();
      var action = form.attr('/note_pages');
      $[method](action, form.serialize(), function(data) {
      });
    },5000);

  });
})();