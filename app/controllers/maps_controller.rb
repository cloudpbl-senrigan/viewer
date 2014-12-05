class MapsController < ApplicationController
  def index
  end

  def fetch_photo
    @photo = generate_photo(Photo.find_by(x: params[:x], y: params[:y], z: params[:z], theta: params[:theta]))
    render json: @photo
  end
  
  def feel_all_around
    x = params[:x].to_i
    y = params[:y].to_i
    z = params[:z].to_i

    flags = {
      forward: Photo.find_by(x: x, y: y+1, z: z).present?,
      back: Photo.find_by(x: x, y: y-1, z: z).present?,
      left: Photo.find_by(x: x-1, y: y, z: z).present?,
      right: Photo.find_by(x: x+1, y: y, z: z).present?
    }
    render json: flags
  end

  def map_get
    x = params[:x].to_i
    y = params[:y].to_i
    z = params[:z].to_i

    flag = {
      northwest: Photo.find_by(x: x-1, y: y+1, z: z).present?,
      north: Photo.find_by(x: x, y: y+1, z: z).present?,
      northeast: Photo.find_by(x: x+1, y: y+1, z: z).present?,
      west: Photo.find_by(x: x-1, y: y, z: z).present?,
      center: Photo.find_by(x: x, y: y, z: z).present?,
      east: Photo.find_by(x: x+1, y: y, z: z).present? ,
      southwest: Photo.find_by(x: x-1, y: y-1, z: z).present?,
      south: Photo.find_by(x: x, y: y-1, z: z).present?,
      southeast: Photo.find_by(x: x+1, y: y-1, z: z).present?
    }
    render json: flag
  end 

  private
  # 写真が無かった場合にダミーのphotoオブジェクト作成
  def generate_photo(photo)
    unless photo
      photo = Photo.new(x: nil, y: nil, z: nil, theta: nil, path: "/images/no-image.png")
    end
    photo
  end

end
