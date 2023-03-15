class User < ApplicationRecord
  before_create :default_image
  
  has_many :trip_users, dependent: :destroy
  has_many :trips, through: :trip_users
  
  has_one_attached :image do |attachable|
    attachable.variant :display, resize_to_limit: [400, 400]
  end

  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true

  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "指定のフォーマットのみ登録可能です" },
                      size:         { less_than: 5.megabytes,
                                      message:   "画像のサイズは5MBまでです" }
                                      
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  def update_with_password(params)
    params.delete(:current_password)
    
    if params[:password].blank?
        params.delete(:password)
        params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = update(params)

    clean_up_passwords
    result
  end
  
  def default_image
    self.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-image.png')), filename: 'default-image.png', content_type: 'image/png')
  end
end
