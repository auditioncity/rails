class Actor < ActiveRecord::Base
  belongs_to :user
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :emails, as: :contactable, class_name: "Email", dependent: :destroy
  has_many :phone_numbers, as: :contactable, class_name: "PhoneNumber", dependent: :destroy
  has_many :websites, as: :contactable, class_name: "Website", dependent: :destroy

  has_attached_file :headshot, styles: {
      thumb: '124x155>',
      small: '400x500>',
      mobile: '800x1000>',
      large: '1600x2000>',
      full: '2400x3000>'
  }
  validates_attachment :headshot, content_type: { content_type: "image/jpeg"}, size: {in: 0..4.megabytes}

  has_attached_file :resume
  validates_attachment_content_type :resume, content_type: ['application/pdf']
end
