AngulaRails.controller "TacoOrderController", ($scope, $filter) ->
  $scope.tacos = []
  $scope.taco = {}
  $scope.fillings = ["Beef", "Chicken", "Fish", "Veggies"]
  $scope.extras = [{name: "Sour Cream"}, {name: "Guac"}, {name: "Salsa"}]
  $scope.cheeses = ["None", "Normal", "Mucho",]


  $scope.clear = () ->
    $scope.taco = {}
    for extra in $scope.extras
      extra.checked = false

  $scope.getExtras = () ->
    extras = []
    for extra in $scope.extras
      if extra.checked == true
        extras.push(extra.name)
    extras

  $scope.addTaco = () ->
    $scope.taco.extras = $scope.getExtras()
    $scope.tacos.push($scope.taco)

    $scope.clear()
