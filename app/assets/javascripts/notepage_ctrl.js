/* global angular */

    // $scope.autoSave = setInterval(function() {
    //   var form = $('#text');
    //   var method = form.attr('patch').toLowerCase();
    //   var action = form.attr('/note_pages');
    //   $[method](action, form.serialize(), function(data) {
    //   });
    // },5000);

// WHAT TO DO ABOUT THIS RESPONSE. HOW TO GET RESPONSE FROM UPDATE?

(function() {
  angular.module("app").controller("notes", function($scope, $http) {
    $scope.setup = function() {
      $http.get('/api/notes.json').then(function(response) {
        $scope.notes = response.data;
      });
    };

    $scope.clickedTextArea = function(textArea) {
      console.log(textArea);
    };

    $scope.newNote = function(inputNotePageId) {
      var note = {
        'text': null,
        'note_page_id': inputNotePageId
      };
      $http.post('/api/notes.json', note).then(function(response) {
        console.log(response);
        $scope.note.push(note);
        
      }, function(error) {
        console.log(error);
        $scope.errors = error.data.errors;
      });
    };

    $scope.editNote = function(inputNoteObject) {
      var note = {
        'id': inputNoteObject.id,
        'text': inputNoteObject.text,
        'note_page_id': inputNoteObject.note_page_id
      };
      $http.patch('/api/notes/:id.json', note).then(function(response) {
        console.log(response);
        $scope.note.push(note);
        
      }, function(error) {
        console.log(error);
        $scope.errors = error.data.errors;
      });
    };

    $scope.deleteNote = function(inputText) {
      var index = $scope.people.indexOf(inputText);
      $scope.people.splice(index, 1);
    };

    window.$scope = $scope;
  });
})();