class Actor < ActiveRecord::Base
  belongs_to :user
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :emails, as: :contactable, class_name: "Email", dependent: :destroy
  has_many :phone_numbers, as: :contactable, class_name: "PhoneNumber", dependent: :destroy
  has_many :websites, as: :contactable, class_name: "Website", dependent: :destroy

  has_attached_file :headshot
  validates_attachment :headshot, content_type: { content_type: "image/jpeg"}, size: {in: 0..5.megabytes}
end
