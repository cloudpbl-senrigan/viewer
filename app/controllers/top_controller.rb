# -*- coding: utf-8 -*-
class TopController < ApplicationController

  def index
  end

  def display
    @photo = generate_photo(ImageProcessedTable.find_by(x: params[:x], y: params[:y], z: params[:z], theta: params[:theta]))
    @direction = params[:direction]
    @photo_path = "/images/#{File.basename(@photo.path)}"
  end

  def init
    @direction = params[:direction]
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
