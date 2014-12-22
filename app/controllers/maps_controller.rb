class MapsController < ApplicationController
  def index
  end

  def fetch_photo
    @photo = generate_photo(ImageProcessedTable.find_by(x: params[:x], y: params[:y], z: params[:z], theta: params[:theta]))
    render json: @photo
  end
  
  def feel_all_around
    x = params[:x].to_i
    y = params[:y].to_i
    z = params[:z].to_i

    flags = {
      forward: ImageProcessedTable.find_by(x: x, y: y+1, z: z).present?,
      back: ImageProcessedTable.find_by(x: x, y: y-1, z: z).present?,
      left: ImageProcessedTable.find_by(x: x-1, y: y, z: z).present?,
      right: ImageProcessedTable.find_by(x: x+1, y: y, z: z).present?
    }
    render json: flags
  end

  def map_get
    x = params[:x].to_i
    y = params[:y].to_i
    z = params[:z].to_i

    flag = {
      northwest: ImageProcessedTable.find_by(x: x-1, y: y+1, z: z).present?,
      north: ImageProcessedTable.find_by(x: x, y: y+1, z: z).present?,
      northeast: ImageProcessedTable.find_by(x: x+1, y: y+1, z: z).present?,
      west: ImageProcessedTable.find_by(x: x-1, y: y, z: z).present?,
      center: ImageProcessedTable.find_by(x: x, y: y, z: z).present?,
      east: ImageProcessedTable.find_by(x: x+1, y: y, z: z).present? ,
      southwest: ImageProcessedTable.find_by(x: x-1, y: y-1, z: z).present?,
      south: ImageProcessedTable.find_by(x: x, y: y-1, z: z).present?,
      southeast: ImageProcessedTable.find_by(x: x+1, y: y-1, z: z).present?
    }
    render json: flag
  end 

  private
  # 写真が無かった場合にダミーのphotoオブジェクト作成
  def generate_photo(photo)
    unless photo
      photo = ImageProcessedTable.new(x: nil, y: nil, z: nil, theta: nil, path: "/images/no-image.png")
    end
    photo
  end

end
