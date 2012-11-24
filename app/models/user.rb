# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation, :remember_me
  ##attr_accessible :email, :name, :password, :password_confirmation #Removed for devise
  ##has_secure_password # Removed for devise
  has_many :picposts, dependent: :destroy
  has_many :picture_ratings, dependent: :destroy
  has_many :picture_comments, dependent: :destroy

  has_many :comment_ratings, foreign_key: "rater_id", dependent: :destroy
  has_many :rated_users, through: :comment_ratings, source: :rated
  has_many :reverse_comment_ratings, foreign_key: "rated_id",
                                     class_name: "CommentRating",
                                     dependent: :destroy
  has_many :rater_users, through: :reverse_comment_ratings, source: :rater

  has_many :favorites, dependent: :destroy
  has_many :favorite_picposts, through: :favorites, source: :picpost

  ## before_save { |user| user.email = email.downcase } # Removed for devise
  ## before_save :create_remember_token # Removed for devise

  validates :name, presence: true, length: { maximum: 50 }

   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
   validates :password, presence: true, length: { minimum: 6 }
   validates :password_confirmation, presence: true

#  validates_uniqueness_of :picture_rating, scope: :picpost

  def rating(picpost)
    picture_rating = PictureRating.find_by_user_id_and_picpost_id(self.id, picpost.id)
    return picture_rating.nil? ? nil : picture_rating.rating
  end

  def rate!(picpost, rating)
    picture_ratings.create!(picpost_id: picpost.id, rating: rating)    
  end
 
  def unrate!(picpost)
    picture_ratings.find_by_picpost_id(picpost.id).destroy
  end

  def comment!(picpost, comment)
    picture_comments.create!(picpost_id: picpost.id, comment: comment)
  end

  def rate_comment!(picture_comment,rating)
    comment_ratings.create!(rated_id: picture_comment.user.id, picture_comment_id: picture_comment.id, rating: rating)
  end

  def unrate_comment!(picture_comment)
    comment_ratings.find_by_rated_id_and_picture_comment_id(picture_comment.user.id,picture_comment.id).destroy
  end

  def get_comment_rating(picture_comment)
    comment_ratings.find_by_picture_comment_id(picture_comment.id)
  end
 
  def favored_picpost?(picpost)
    favorites.find_by_picpost_id(picpost.id)
  end

  def favor_picpost!(picpost)
    favorites.create!(picpost_id: picpost.id)
  end

  def unfavor_picpost!(picpost)
    favorites.find_by_picpost_id(picpost.id).destroy
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
