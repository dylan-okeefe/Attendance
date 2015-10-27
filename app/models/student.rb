class Student < ActiveRecord::Base
  has_many :attendances
  has_many :classes, through: :attendances
  has_many :notes

  belongs_to :user

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
