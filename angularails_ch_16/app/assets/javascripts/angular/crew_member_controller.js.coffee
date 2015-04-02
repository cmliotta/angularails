AngulaRails.controller "CrewMemberController" , ($scope, Crew, position, $stateParams) ->
  $scope.crew = Crew.find($stateParams.id)
  $scope.position = position