/* global angular */
(function() {
  var app = angular.module("app");

  app.directive('contenteditable', function() {
        return {
          require: 'ngModel',
          restrict: 'A',
          link: function(scope, elm, attr, ngModel) {

            function updateViewValue() {
              ngModel.$setViewValue(this.innerHTML);
            }
            elm.on('keyup', updateViewValue);

            scope.$on('$destroy', function() {
              elm.off('keyup', updateViewValue);
            });

            ngModel.$render = function(){
               elm.html(ngModel.$viewValue);
            }

          }
      }
  });

  var notepageCtrl = app.controller('notesCtrl', function notesCtrl($scope, $http) {

    $scope.urlId = window.location.pathname.split("/")[2];

    $scope.editPageSummary = function(notepagesummary) {
      var page = {
        'id': $scope.urlId,
        'summary': notepagesummary
      };
      $http.patch('/api/note_pages/' + $scope.urlId + '.rabl', page).then(function(response) {
        console.log(response);
        console.log(page);        
      }, function(error) {
        console.log(error);
        $scope.errors = error.data.errors;
      }
      )
    };

    $scope.setup = function() {
      $http.get('/api/note_pages/' + $scope.urlId + '.rabl').then(function(response) {
        $scope.inputData = response.data.note_page.notes;
        $scope.notes = [];
        for (var i = 0; i < $scope.inputData.length; i++) {
          $scope.notes.push($scope.inputData[i].note);
        }
      });
    };

    // $scope.clickedTextArea = function(textArea) {
    //   console.log(textArea);
    // };

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

    $scope.editNote = function(inputNoteObject, input) {
      $scope.note = {
        'id': inputNoteObject.id,
        'text': input,
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

    $scope.editBookmark = function(bookmarkId, targetId) {
      $scope.bookmark = {
        'id': bookmarkId,
        'note_id': targetId
      };

      $http.patch('/api/bookmarks/' + bookmarkId + '.rabl', $scope.bookmark).then(function(response) {
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
  notepageCtrl.$inject = ['$scope', '$http', 'notesCtrl'];
})();

// normal notepage javascript
function allowDrop(ev) {
  ev.preventDefault();
}

function drag(ev, bookmarkId) {
  ev.dataTransfer.setData("text", bookmarkId);
}

function drop(ev) {
  ev.preventDefault();
  var data = ev.dataTransfer.getData("text");
  $scope.editBookmark(data, ev.target.id);
  ev.target.appendChild(document.getElementById("bookmark" + data));
}
