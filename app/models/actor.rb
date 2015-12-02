class Actor < ActiveRecord::Base
  belongs_to :user
  has_many :addresses, as: :addressable
  has_many :emails, as: :contactable, class_name: "Email"
  has_many :phone_numbers, as: :contactable, class_name: "PhoneNumber"
  has_many :websites, as: :contactable, class_name: "Website"
end
