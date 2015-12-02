class ContactInformation < ActiveRecord::Base
  belongs_to :contactable, polymorphic: true
end
