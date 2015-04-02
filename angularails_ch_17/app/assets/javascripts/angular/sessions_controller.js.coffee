AngulaRails.controller "SessionsController", ($scope, $http) ->
  $scope.current_user = JSON.parse($("meta[name='current_user']").attr('content'))

  $scope.authErrors = []

  $scope.authorized = () ->
    $scope.current_user? and $scope.current_user.id?

  $scope.signIn = () ->
    $scope.authErrors = []
    authData = {user: {email: $scope.email, password: $scope.password}}

    $http(
      method: "POST"
      url: "/users/sign_in"
      headers: {'X-CSRF-Token': $('meta[name=csrf-token]').attr('content')}
      data: authData
    )
    .success (data) ->
      $scope.current_user = data
    .error (data, status) ->
      $scope.authErrors = data['error']

  $scope.signOut = () ->
    $http(
      method: "DELETE"
      url: "/users/sign_out"
      headers: {'X-CSRF-Token': $('meta[name=csrf-token]').attr('content')}
    )
    .success (data) ->
      $scope.current_user = null
    .error (data, status) ->
      alert("Error: #{status}. #{data}")
