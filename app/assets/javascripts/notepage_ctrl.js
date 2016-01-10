/* global angular */

(function() {
  angular.module("app").controller("notepage", function($scope, $http) {

    // $scope.autoSave = setInterval(function() {
    //   var form = $('#text');
    //   var method = form.attr('patch').toLowerCase();
    //   var action = form.attr('/note_pages');
    //   $[method](action, form.serialize(), function(data) {
    //   });
    // },5000);

    window.$scope = $scope;

  });
})();