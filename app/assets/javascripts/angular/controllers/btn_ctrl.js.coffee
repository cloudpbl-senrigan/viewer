App.controller "BtnCtrl", ['$scope', 'switchArrow', ($scope, switchArrow) ->
  $scope.flags = {
      forward: true,
      back: false,
      left: false,
      right: false
  }
  
  $scope.forward = ->
      switchArrow.switching($scope.flags, "forward")
  $scope.back = ->
      switchArrow.switching($scope.flags, "back")
  $scope.left = ->
      switchArrow.switching($scope.flags, "left")
  $scope.right = ->
      switchArrow.switching($scope.flags, "right")
]
