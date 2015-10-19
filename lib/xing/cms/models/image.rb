# == Schema Information
#
# Table name: images
#
#  id                 :integer          not null, primary key
#  image_file_name    :string(255)
#  image_file_size    :integer
#  image_content_type :string(255)
#  image_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

require 'xing/cms/uploaders/image_uploader'
require 'carrierwave/orm/activerecord'

module Xing
  module Cms
    class Image < ActiveRecord::Base

      mount_uploader :image, ImageUploader, :mount_on => :image_file_name
      validates_integrity_of :image
    end
  end
end
