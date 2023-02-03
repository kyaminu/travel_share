class User < ApplicationRecord
  has_many :trip_users, dependent: :destroy
  has_many :trip_names, through: :trip_users, source: :trip
  has_one_attached :image do |attachable|
     attachable.variant :display, resize_to_limit: [500, 500]
   end
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" },
                      size:         { less_than: 5.megabytes,
                                      message:   "should be less than 5MB" }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
