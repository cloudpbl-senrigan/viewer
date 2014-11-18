class MapsController < ApplicationController
  def index
    @photos = Array.new
    @photos << generate_photo(Photo.find_by(x: 0, y: 0, z: 0, theta: 0))
    @photos << generate_photo(Photo.find_by(x: 0, y: 0, z: 0, theta: 180))
    @photos << generate_photo(Photo.find_by(x: 0, y: 0, z: 0, theta: 270))
    @photos << generate_photo(Photo.find_by(x: 0, y: 0, z: 0, theta: 90))
    render "index", :formats => [:json], :handlers => [:jbuilder]
  end

  private
  def generate_photo(photo)
    unless photo
      photo = Photo.new(x: nil, y: nil, z: nil, theta: nil, path: nil)
    end
    photo
  end
end
