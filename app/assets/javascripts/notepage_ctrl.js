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

    $scope.urlId = window.location.pathname.split("/")[2];

    $scope.setup = function() {
      $http.get('/api/note_pages/' + $scope.urlId + '.rabl').then(function(response) {
        $scope.inputData = response.data.note_page.notes;
        $scope.notes = [];
        for ( i = 0; i < $scope.inputData.length; i++) {
          $scope.notes.push($scope.inputData[i].note);
        }
      });
    };
      // $http.get('/api/bookmarks.json').then(function(response) {
      //   $scope.bookmarks = response.data;
      // });
    // };

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

    // $scope.myModel = {};
    // var timeout = null;

    $scope.editNote = function(inputText, inputNoteObject) {
      console.log(inputText, inputNoteObject);
      inputNoteObject.text = inputNoteObject.text + inputText;
      $scope.note = {
        'id': inputNoteObject.id,
        'text': inputNoteObject.text + inputText,
        'note_page_id': inputNoteObject.note_page_id
      };

      // var debounceSaveUpdates = function(newVal, oldVal) {
      //   if (newVal !== oldVal) {
      //     if (timeout) {
      //       $timeout.cancel(timeout);
      //     }
      //     timeout = $timeout($scope.editNote, 1000);
      //   }
      // };
      // $scope.$watch('noteText', debounceSaveUpdates);

      $http.patch('/api/notes/' + $scope.note.id + '.rabl', $scope.note).then(function(response) {
        console.log(response);
        console.log($scope.note);

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