(function() {
  "use strict";

  angular.module("app").controller("todoList", function($scope) {

    $scope.autoSave = setInterval(function(){
    var form = $('#text');
    var method = form.attr('patch').toLowerCase();      
    var action = form.attr('/note_pages');
    $[method](action, form.serialize(), function(data){
    });
},5000); 

  });
})();