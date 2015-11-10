class Company
  include Mongoid::Document

  belongs_to :user

  field :qb_id

  mount_uploader :logo, ImageUploader
end