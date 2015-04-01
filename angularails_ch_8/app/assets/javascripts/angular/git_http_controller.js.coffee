AngulaRails.controller "GitHttpController", ($scope, $http) ->

  $scope.search = () ->
    $scope.repos = []
    $scope.searching = true
    $scope.errorMessage = ""
    url = "https://api.github.com/users/#{$scope.username}/repos"
    $http({ method: "GET", url: url })
      .success (data) ->
        $scope.searching = false
        $scope.repos = data
      .error (data, status) ->
        $scope.searching = false
        if status == 404
          $scope.errorMessage = "User not found"

  # $scope.search = () ->
  #   $scope.repos = []
  #   $scope.searching = true
  #   $scope.errorMessage = ""
  #   url = "https://api.github.com/users/#{$scope.username}/repos"
  #   $.ajax
  #     type: "GET"
  #     url: url
  #     success: (data) ->
  #       $scope.searching = false
  #       $scope.repos = data
  #       $scope.$apply()
  #     error: (error) ->
  #       $scope.searching = false
  #       if error.status == 404
  #         $scope.errorMessage = "User not found"
  #       $scope.$apply()