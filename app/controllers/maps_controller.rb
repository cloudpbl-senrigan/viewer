# -*- coding: utf-8 -*-
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
     aa: ImageProcessedTable.find_by(x: x-5, y: y+5, z: z).present?, ab: ImageProcessedTable.find_by(x: x-4, y: y+5, z: z).present?, ac: ImageProcessedTable.find_by(x: x-3, y: y+5, z: z).present?, 
     ad: ImageProcessedTable.find_by(x: x-2, y: y+5, z: z).present?, ae: ImageProcessedTable.find_by(x: x-1, y: y+5, z: z).present?, af: ImageProcessedTable.find_by(x: x, y: y+5, z: z).present?,
     ag: ImageProcessedTable.find_by(x: x+1, y: y+5, z: z).present?, ah: ImageProcessedTable.find_by(x: x+2, y: y+5, z: z).present?, ai: ImageProcessedTable.find_by(x: x+3, y: y+5, z: z).present?,
     aj: ImageProcessedTable.find_by(x: x+4, y: y+5, z: z).present?, ak: ImageProcessedTable.find_by(x: x+5, y: y+5, z: z).present?,
     ba: ImageProcessedTable.find_by(x: x-5, y: y+4, z: z).present?, bb: ImageProcessedTable.find_by(x: x-4, y: y+4, z: z).present?, bc: ImageProcessedTable.find_by(x: x-3, y: y+4, z: z).present?, 
     bd: ImageProcessedTable.find_by(x: x-2, y: y+4, z: z).present?, be: ImageProcessedTable.find_by(x: x-1, y: y+4, z: z).present?, bf: ImageProcessedTable.find_by(x: x, y: y+4, z: z).present?,
     bg: ImageProcessedTable.find_by(x: x+1, y: y+4, z: z).present?, bh: ImageProcessedTable.find_by(x: x+2, y: y+4, z: z).present?, bi: ImageProcessedTable.find_by(x: x+3, y: y+4, z: z).present?,
     bj: ImageProcessedTable.find_by(x: x+4, y: y+4, z: z).present?, bk: ImageProcessedTable.find_by(x: x+5, y: y+4, z: z).present?,
     ca: ImageProcessedTable.find_by(x: x-5, y: y+3, z: z).present?, cb: ImageProcessedTable.find_by(x: x-4, y: y+3, z: z).present?, cc: ImageProcessedTable.find_by(x: x-3, y: y+3, z: z).present?, 
     cd: ImageProcessedTable.find_by(x: x-2, y: y+3, z: z).present?, ce: ImageProcessedTable.find_by(x: x-1, y: y+3, z: z).present?, cf: ImageProcessedTable.find_by(x: x, y: y+3, z: z).present?,
     cg: ImageProcessedTable.find_by(x: x+1, y: y+3, z: z).present?, ch: ImageProcessedTable.find_by(x: x+2, y: y+3, z: z).present?, ci: ImageProcessedTable.find_by(x: x+3, y: y+3, z: z).present?,
     cj: ImageProcessedTable.find_by(x: x+4, y: y+3, z: z).present?, ck: ImageProcessedTable.find_by(x: x+5, y: y+3, z: z).present?,
     da: ImageProcessedTable.find_by(x: x-5, y: y+2, z: z).present?, db: ImageProcessedTable.find_by(x: x-4, y: y+2, z: z).present?, dc: ImageProcessedTable.find_by(x: x-3, y: y+2, z: z).present?, 
     dd: ImageProcessedTable.find_by(x: x-2, y: y+2, z: z).present?, de: ImageProcessedTable.find_by(x: x-1, y: y+2, z: z).present?, df: ImageProcessedTable.find_by(x: x, y: y+2, z: z).present?,
     dg: ImageProcessedTable.find_by(x: x+1, y: y+2, z: z).present?, dh: ImageProcessedTable.find_by(x: x+2, y: y+2, z: z).present?, di: ImageProcessedTable.find_by(x: x+3, y: y+2, z: z).present?,
     dj: ImageProcessedTable.find_by(x: x+4, y: y+2, z: z).present?, dk: ImageProcessedTable.find_by(x: x+5, y: y+2, z: z).present?,
     ea: ImageProcessedTable.find_by(x: x-5, y: y+1, z: z).present?, eb: ImageProcessedTable.find_by(x: x-4, y: y+1, z: z).present?, ec: ImageProcessedTable.find_by(x: x-3, y: y+1, z: z).present?, 
     ed: ImageProcessedTable.find_by(x: x-2, y: y+1, z: z).present?, ee: ImageProcessedTable.find_by(x: x-1, y: y+1, z: z).present?, ef: ImageProcessedTable.find_by(x: x, y: y+1, z: z).present?,
     eg: ImageProcessedTable.find_by(x: x+1, y: y+1, z: z).present?, eh: ImageProcessedTable.find_by(x: x+2, y: y+1, z: z).present?, ei: ImageProcessedTable.find_by(x: x+3, y: y+1, z: z).present?,
     ej: ImageProcessedTable.find_by(x: x+4, y: y+1, z: z).present?, ek: ImageProcessedTable.find_by(x: x+5, y: y+1, z: z).present?,
     fa: ImageProcessedTable.find_by(x: x-5, y: y, z: z).present?, fb: ImageProcessedTable.find_by(x: x-4, y: y, z: z).present?, fc: ImageProcessedTable.find_by(x: x-3, y: y, z: z).present?, 
     fd: ImageProcessedTable.find_by(x: x-2, y: y, z: z).present?, fe: ImageProcessedTable.find_by(x: x-1, y: y, z: z).present?, ff: ImageProcessedTable.find_by(x: x, y: y, z: z).present?,
     fg: ImageProcessedTable.find_by(x: x+1, y: y, z: z).present?, fh: ImageProcessedTable.find_by(x: x+2, y: y, z: z).present?, fi: ImageProcessedTable.find_by(x: x+3, y: y, z: z).present?,
     fj: ImageProcessedTable.find_by(x: x+4, y: y, z: z).present?, fk: ImageProcessedTable.find_by(x: x+5, y: y, z: z).present?,
     ga: ImageProcessedTable.find_by(x: x-5, y: y-1, z: z).present?, gb: ImageProcessedTable.find_by(x: x-4, y: y-1, z: z).present?, gc: ImageProcessedTable.find_by(x: x-3, y: y-1, z: z).present?, 
     gd: ImageProcessedTable.find_by(x: x-2, y: y-1, z: z).present?, ge: ImageProcessedTable.find_by(x: x-1, y: y-1, z: z).present?, gf: ImageProcessedTable.find_by(x: x, y: y-1, z: z).present?,
     gg: ImageProcessedTable.find_by(x: x+1, y: y-1, z: z).present?, gh: ImageProcessedTable.find_by(x: x+2, y: y-1, z: z).present?, gi: ImageProcessedTable.find_by(x: x+3, y: y-1, z: z).present?,
     gj: ImageProcessedTable.find_by(x: x+4, y: y-1, z: z).present?, gk: ImageProcessedTable.find_by(x: x+5, y: y-1, z: z).present?,
     ha: ImageProcessedTable.find_by(x: x-5, y: y-2, z: z).present?, hb: ImageProcessedTable.find_by(x: x-4, y: y-2, z: z).present?, hc: ImageProcessedTable.find_by(x: x-3, y: y-2, z: z).present?, 
     hd: ImageProcessedTable.find_by(x: x-2, y: y-2, z: z).present?, he: ImageProcessedTable.find_by(x: x-1, y: y-2, z: z).present?, hf: ImageProcessedTable.find_by(x: x, y: y-2, z: z).present?,
     hg: ImageProcessedTable.find_by(x: x+1, y: y-2, z: z).present?, hh: ImageProcessedTable.find_by(x: x+2, y: y-2, z: z).present?, hi: ImageProcessedTable.find_by(x: x+3, y: y-2, z: z).present?,
     hj: ImageProcessedTable.find_by(x: x+4, y: y-2, z: z).present?, hk: ImageProcessedTable.find_by(x: x+5, y: y-2, z: z).present?,
     iia: ImageProcessedTable.find_by(x: x-5, y: y-3, z: z).present?, iib: ImageProcessedTable.find_by(x: x-4, y: y-3, z: z).present?, iic: ImageProcessedTable.find_by(x: x-3, y: y-3, z: z).present?, 
     iid: ImageProcessedTable.find_by(x: x-2, y: y-3, z: z).present?, iie: ImageProcessedTable.find_by(x: x-1, y: y-3, z: z).present?, iif: ImageProcessedTable.find_by(x: x, y: y-3, z: z).present?,
     iig: ImageProcessedTable.find_by(x: x+1, y: y-3, z: z).present?, iih: ImageProcessedTable.find_by(x: x+2, y: y-3, z: z).present?, iii: ImageProcessedTable.find_by(x: x+3, y: y-3, z: z).present?,
     iij: ImageProcessedTable.find_by(x: x+4, y: y-3, z: z).present?, iik: ImageProcessedTable.find_by(x: x+5, y: y-3, z: z).present?,
     ja: ImageProcessedTable.find_by(x: x-5, y: y-4, z: z).present?, jb: ImageProcessedTable.find_by(x: x-4, y: y-4, z: z).present?, jc: ImageProcessedTable.find_by(x: x-3, y: y-4, z: z).present?, 
     jd: ImageProcessedTable.find_by(x: x-2, y: y-4, z: z).present?, je: ImageProcessedTable.find_by(x: x-1, y: y-4, z: z).present?, jf: ImageProcessedTable.find_by(x: x, y: y-4, z: z).present?,
     jg: ImageProcessedTable.find_by(x: x+1, y: y-4, z: z).present?, jh: ImageProcessedTable.find_by(x: x+2, y: y-4, z: z).present?, ji: ImageProcessedTable.find_by(x: x+3, y: y-4, z: z).present?,
     jj: ImageProcessedTable.find_by(x: x+4, y: y-4, z: z).present?, jk: ImageProcessedTable.find_by(x: x+5, y: y-4, z: z).present?,
     ka: ImageProcessedTable.find_by(x: x-5, y: y-5, z: z).present?, kb: ImageProcessedTable.find_by(x: x-4, y: y-5, z: z).present?, jc: ImageProcessedTable.find_by(x: x-3, y: y-5, z: z).present?, 
     kd: ImageProcessedTable.find_by(x: x-2, y: y-5, z: z).present?, ke: ImageProcessedTable.find_by(x: x-1, y: y-5, z: z).present?, jf: ImageProcessedTable.find_by(x: x, y: y-5, z: z).present?,
     kg: ImageProcessedTable.find_by(x: x+1, y: y-5, z: z).present?, kh: ImageProcessedTable.find_by(x: x+2, y: y-5, z: z).present?, ji: ImageProcessedTable.find_by(x: x+3, y: y-5, z: z).present?,
     kj: ImageProcessedTable.find_by(x: x+4, y: y-5, z: z).present?, kk: ImageProcessedTable.find_by(x: x+5, y: y-5, z: z).present?
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
