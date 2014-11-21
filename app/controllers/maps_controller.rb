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

  private
  # 写真が無かった場合にダミーのphotoオブジェクト作成
  def generate_photo(photo)
    unless photo
      photo = Photo.new(x: nil, y: nil, z: nil, theta: nil, path: "/images/no-image.png")
    end
    photo
  end

end
