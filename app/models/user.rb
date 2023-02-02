class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments, foreign_key: :author_id, dependent: :delete_all
  has_many :posts, foreign_key: :author_id, dependent: :delete_all
  has_many :likes, foreign_key: :author_id, dependent: :delete_all

  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }

   # User::Roles
  # The available roles
  ROLES = %i[admin default].freeze

  def is?(requested_role)
    role == requested_role
  end

  # def admin?
  #   true
  # end

  
  def most_recent_post
    posts.order(created_at: :desc).limit(3)
  end
end
