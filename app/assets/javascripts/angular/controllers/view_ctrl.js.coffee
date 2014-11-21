App.controller "ViewCtrl", ["$scope", "fetchMapInfo",
($scope, fetchMapInfo) ->
  # パラメータ宣言
  $scope.col = {
    x: 0,
    y: 0,
    z: 0
  }
  $scope.theta = 0

  $scope.direction = {
      forward: true,
      back: false,
      left: false,
      right: false
  }

  $scope.hasPhoto = {
      forward: false,
      back: false,
      left: false,
      right: false
  }

  # 初期画像取得
  $scope.photo = fetchMapInfo.fetch_photo_with($scope.col,
                                               $scope.theta).query()
  $scope.hasPhoto = fetchMapInfo.feel_all_around($scope.col).query()

  updateMapInfo = () ->
      $scope.photo = fetchMapInfo.fetch_photo_with($scope.col,
                                                   $scope.theta).query()
      $scope.hasPhoto = fetchMapInfo.feel_all_around($scope.col).query()

  moveTo = (direction) ->
    switch direction
      when "forward"
        $scope.col.y += 1
        $scope.theta = 0
      when "back"
        $scope.col.y += -1
        $scope.theta = 180
      when "left"
        $scope.col.x += -1
        $scope.theta = 270
      when "right"
        $scope.col.x += 1
        $scope.theta = 90

  turnTo = (direction) ->
    switch direction
      when "left"
        $scope.theta = ($scope.theta + 270) % 360
      when "right"
        $scope.theta = ($scope.theta + 90) % 360
  
  # ボタン処理の部分
  $scope.goForward = ->
      moveTo("forward")
      updateMapInfo()
  $scope.goBack = ->
      moveTo("back")
      updateMapInfo()
  $scope.goLeft = ->
      moveTo("left")
      updateMapInfo()
  $scope.goRight = ->
      moveTo("right")
      updateMapInfo()
  $scope.turnLeft = ->
      turnTo("left")
      updateMapInfo()
  $scope.turnRight = ->
      turnTo("right")
      updateMapInfo()
]
