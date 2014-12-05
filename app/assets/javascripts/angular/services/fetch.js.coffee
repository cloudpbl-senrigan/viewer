App.factory 'fetchMapInfo', ['$resource', ($resource) ->
  fetch_photo_with = (col, theta) ->
    $resource '/maps/fetchPhoto/:x/:y/:z/:theta',
      {x: col.x, y: col.y, z: col.z, theta: theta},
      {'query': { method: 'GET', isArray: false }}

  feel_all_around = (col) ->
    $resource '/maps/feelAllAround/:x/:y/:z',
      {x: col.x, y: col.y, z: col.z},
      {'query': { method: 'GET', isArray: false}}

  map_get = (col) ->
    $resource '/maps/map_get/:x/:y/:z',
      {x: col.x, y: col.y, z: col.z},
      {'query': { method: 'GET', isArray: false}}

  {
    fetch_photo_with: fetch_photo_with,
    feel_all_around: feel_all_around,
    map_get: map_get,
  }
]
