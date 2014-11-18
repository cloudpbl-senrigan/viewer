json.array!(@photos) do |photo|
  json.extract! photo, :path, :x, :y, :z, :theta
end
