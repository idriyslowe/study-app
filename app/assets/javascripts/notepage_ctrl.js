/* global angular */

(function() {
  angular.module("app").controller("notes", function($scope, $http) {

    $scope.urlId = window.location.pathname.split("/")[2];

    $scope.setup = function() {
      $http.get('/api/note_pages/' + $scope.urlId + '.rabl').then(function(response) {
        $scope.inputData = response.data.note_page.notes;
        $scope.notes = [];
        for (i = 0; i < $scope.inputData.length; i++) {
          $scope.notes.push($scope.inputData[i].note);
        }
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
      $http.post('/api/notes.rabl', note).then(function(response) {
        console.log(response);
        $scope.note.push(note);
        
      }, function(error) {
        console.log(error);
        $scope.errors = error.data.errors;
      });
    };

    $scope.editNote = function(inputText, inputNoteObject) {
      console.log(inputText, inputNoteObject);
      inputNoteObject.text = inputNoteObject.text + inputText;
      $scope.note = {
        'id': inputNoteObject.id,
        'text': inputNoteObject.text + inputText,
        'note_page_id': inputNoteObject.note_page_id
      };

      $http.patch('/api/notes/' + $scope.note.id + '.rabl', $scope.note).then(function(response) {
        console.log(response);
        console.log($scope.note);

      }, function(error) {
        console.log(error);
        $scope.errors = error.data.errors;
      });
    };

    $scope.editBookmark = function(inputId, inputBookmarkObject) {
      console.log(inputId, inputBookmarkObject);
      inputBookmarkObject.note_id = inputBookmarkObject.text + note_id;
      $scope.bookmark = {
        'id': inputBookmarkObject.id,
        'note_id': inputBookmarkObject.note_id
      };

      $http.patch('/api/bookmarks/' + $scope.bookmark.id + '.rabl', $scope.bookmark).then(function(response) {
        console.log(response);
        console.log($scope.bookmark);

      }, function(error) {
        console.log(error);
        $scope.errors = error.data.errors;
      });
    };

    $scope.deleteNote = function(inputNoteObject) {
      $scope.note = {
        'id': inputNoteObject.id
      };
      $http.delete('/api/notes/' + $scope.note.id + '.rabl', $scope.note).then(function(response) {
        console.log(response);
        var index = $scope.notes.indexOf(inputNoteObject);
        $scope.notes.splice(index, 1);

      }, function(error) {
        console.log(error);
        $scope.errors = error.data.errors;
      });
    };

    window.$scope = $scope;
  });
})();

// normal notepage javascript

function allowDrop(ev) {
  ev.preventDefault();
}
function drag(ev) {
  ev.dataTransfer.setData("text", ev.target.id);
}
var selectedAngularBookmark = angular.element(document.querySelector('[ng-controller="notes"]')).scope().bookmark;

// last line accesses the bookmark scope variable from notes ng-controller. also, call editBookmark().
function drop(ev) {
  ev.preventDefault();
  var data = ev.dataTransfer.getData("text");
  ev.target.appendChild(document.getElementById(data));
}

