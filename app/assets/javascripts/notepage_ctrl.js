/* global angular */

    // $scope.autoSave = setInterval(function() {
    //   var form = $('#text');
    //   var method = form.attr('patch').toLowerCase();
    //   var action = form.attr('/note_pages');
    //   $[method](action, form.serialize(), function(data) {
    //   });
    // },5000);

(function() {
  angular.module("app").controller("notes", function($scope, $http) {
    // function parseNotePageId($scope, $location) {
    //   $scope.id=(/api\/note_pages\/*);
    // }

    $scope.urlId = window.location.pathname.split("/")[2];

    $scope.setup = function() {
      $http.get('/api/note_pages/' + $scope.urlId + '.json').then(function(response) {
        $scope.notes = response.data.notes;
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

    $scope.editNote = function(inputText, inputNoteObject) {
      $scope.note = {
        'id': inputNoteObject.id,
        'text': inputNoteObject.text + inputText,
        'note_page_id': inputNoteObject.note_page_id
      };
      $http.patch('/api/notes/' + $scope.note.id + '.json', $scope.note).then(function(response) {
        console.log(response);
        console.log($scope.note);
        $scope.notes.push($scope.note);
        
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