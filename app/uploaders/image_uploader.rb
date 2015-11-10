# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  process :convert => 'png'

  # use as logo of company
  version :thumbnail do
    resize_to_fit(100, 100)
  end

  def default_url
    return [version_name, "no_image.png"].compact.join('_') if Rails.env.development?
    ActionController::Base.helpers.asset_url([version_name, "no_image.png"].compact.join('_'))
  end  
end
