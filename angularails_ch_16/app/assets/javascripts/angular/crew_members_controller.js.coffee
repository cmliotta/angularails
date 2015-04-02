AngulaRails.controller "CrewMembersController", ($scope, Crew) ->
  $scope.crew = Crew.all()