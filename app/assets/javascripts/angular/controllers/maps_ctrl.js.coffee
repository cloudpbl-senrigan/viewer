App.controller 'MapsCtrl', ['$scope', 'Calls', ($scope, Calls) ->
  photos = Calls.query()
  $scope.photos = photos
  defaultPath = "/images/no-image.png"
  $scope.frontPath = defaultPath
  $scope.backPath = defaultPath
  $scope.leftPath = defaultPath
  $scope.rightPath = defaultPath

  for photo in photos
    if photo.theta == 0
      $scope.frontPath = photo.path
    else if photo.theta == 180
      $scope.backPath = photo.path
    else if photo.theta == 280
      $scope.leftPath = photo.path
    else if photo.theta == 90
      $scope.rightPath = photo.path
]
