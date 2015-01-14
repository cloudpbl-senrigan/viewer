App.controller "ViewCtrl", ["$scope", "fetchMapInfo",
($scope, fetchMapInfo) ->
  # パラメータ宣言
  # とりあえず東京大学工学部2号館を初期位置に
  #$scope.col = {
  #  x: 139.761586,
  #  y: 35.714231,
  #  z: 0
  #}
  $scope.col={
    x: 0,
    y: 0,
    z: 0
  }
  $scope.getlati = 0
  $scope.getlong = 0
  $scope.theta = 0
  $scope.counter = 0

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

  $scope.existMap = {
     aa: false, ab: false, ac: false, ad: false, ae: false, af: false, ag: false, ah: false, ai: false, aj: false, ak: false,
     ba: false, bb: false, bc: false, bd: false, be: false, bf: false, bg: false, bh: false, bi: false, bj: false, bk: false,
     ca: false, cb: false, cc: false, cd: false, ce: false, cf: false, cg: false, ch: false, ci: false, cj: false, ck: false,
     da: false, db: false, dc: false, dd: false, de: false, df: false, dg: false, dh: false, di: false, dj: false, dk: false,
     ea: false, eb: false, ec: false, ed: false, ee: false, ef: false, eg: false, eh: false, ei: false, ej: false, ek: false,
     fa: false, fb: false, fc: false, fd: false, fe: false, ff: false, fg: false, fh: false, fi: false, fj: false, fk: false,
     ga: false, gb: false, gc: false, gd: false, ge: false, gf: false, gg: false, gh: false, gi: false, gj: false, gk: false,
     ha: false, hb: false, hc: false, hd: false, he: false, hf: false, hg: false, hh: false, hi: false, hj: false, hk: false,
     iia: false, iib: false, iic: false, iid: false, iie: false, iif: false, iig: false, iih: false, iii: false, iij: false, iik: false,
     ja: false, jb: false, jc: false, jd: false, je: false, jf:false, jg: false, jh: false, ji: false, jj: false, jk: false,
     ka: false, kb: false, kc: false, kd: false, ke: false, kf:false, kg: false, kh: false, ki: false, kj: false, kk: false
  }
#  $scope.existMap =[]

  # 初期画像取得
  $scope.photo = fetchMapInfo.fetch_photo_with($scope.col,
                                               $scope.theta).query()
  $scope.hasPhoto = fetchMapInfo.feel_all_around($scope.col).query()
  $scope.existMap = fetchMapInfo.map_get($scope.col).query()

  updateMapInfo = () ->
      $scope.counter = $scope.counter + 1
      $scope.photo = fetchMapInfo.fetch_photo_with($scope.col,
                                                   $scope.theta).query()
      $scope.hasPhoto = fetchMapInfo.feel_all_around($scope.col).query()
      $scope.existMap = fetchMapInfo.map_get($scope.col).query()

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
  
  changeTomesh = (lati, long) ->
    $scope.col.x = lati
    $scope.col.y = long

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
  $scope.changezahyou = (getlati, getlong) ->
      changeTomesh(parseInt($scope.getlati, 10), parseInt($scope.getlong, 10))
      updateMapInfo()

]
