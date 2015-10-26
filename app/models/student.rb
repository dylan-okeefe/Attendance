class Student < ActiveRecord::Base
  has_many :attendences
  has_many :classes, through: :attendences
  has_many :notes
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
