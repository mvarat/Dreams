var dreamApp = angular.module("Dream-App", [] );

dreamApp.controller("DreamsController", ["$scope", "$http", function( $scope, $http){

  $scope.getDreams = function () {
    $http.get('/api/dreams').then(function(response){
      $scope.dreams = response.data.dreams;
      console.log("i've got all the dreams in the world!");
    })
  }

  $scope.getDreams();

  $scope.deleteDream = function (dream) {
    var dreamID = dream.id;
    $http.delete('/api/dreams/' + dreamID)
      .success(function (dreamID) {
      console.log("deleted dream")
    }).then(function(){
      $scope.getDreams();
    })
  };


  $scope.createDream = function (dream) {
    var newDream = {
      dream: {
        topic: dream.topic,
        description: dream.description,
        code: dream.code,
        creator: dream.creator,
      }
    }

    $http.post('/api/dreams', newDream)
      .success(function (newDream) {
      console.log("created a new dream")
    }).then(function(){
      $scope.dream = {}
      $scope.getDreams();
    })
  }




}])
