class Trap < ActiveRecord::Base
  validates :uri, presence: true, uniqueness: true, length: { maximum: 255 }
end
