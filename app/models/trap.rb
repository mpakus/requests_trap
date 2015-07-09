class Trap < ActiveRecord::Base
  validates :uri, presence: true, uniqueness: true, length: { maximum: 255 }

  has_many :requests, class_name: 'Trap::Request'
end
