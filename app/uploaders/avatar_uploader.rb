# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  include ::CarrierWave::Backgrounder::Delay

  storage :file

  version :thumb do
    process :resize_to_fit => [250, 250]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
