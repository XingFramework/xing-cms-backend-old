# == Schema Information
#
# Table name: documents
#
#  id                :integer          not null, primary key
#  data_file_name    :string(255)
#  data_file_size    :integer
#  data_content_type :string(255)
#  data_updated_at   :datetime
#  created_at        :datetime
#  updated_at        :datetime
#

require 'xing/cms/uploaders/doc_uploader'
require 'carrierwave/orm/activerecord'

module Xing
  module Cms
    class Document < ActiveRecord::Base

      mount_uploader :data, ::Xing::Cms::DocUploader, :mount_on => :data_file_name
      validates_integrity_of :data
    end
  end
end
