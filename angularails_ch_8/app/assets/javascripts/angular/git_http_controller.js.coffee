AngulaRails.controller "GitHttpController", ($scope, $http) ->
  $scope.search = () ->
    $scope.repos = []
    $scope.searching = true
    url = "https://api.github.com/users/#{$scope.username}/repos"
    $http({ method: "GET", url: url })
      .success (data) ->
        $scope.searching = false
        $scope.repos = data