class User < ActiveRecord::Base
   has_many :posts, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :votes, dependent: :destroy
   has_many :favorites, dependent: :destroy
   before_save { self.email = email.downcase }
   before_save { self.role ||= :member }

   EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

   validates :name, length: { minimum: 1, maximum: 100 }, presence: true

   validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
   validates :password, length: { minimum: 6 }, allow_blank: true

   validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 100 },
             format: { with: EMAIL_REGEX }

   has_secure_password
   
   enum role: [:member, :admin]
   
   def favorite_for(post)
      favorites.where(post_id: post.id).first
      #using .where to retrieve favorites with post_id that matches with post_id
      #CORRECTION - using .where to retrieve favorites with post_id that matches with post.id
      #if user is favorited post it will return an array of one of them, if not it will return an empty array
      #.first will return either the favorite or nil
      #CORRECTION - CALLING FIRST ON THE ARRAY WILL RETURN THE FAVORITE OR NIL DEPENDING 
      #ON WHETHER THEY FAVORITED THE POST. 
      #.FIRST RETURNS THE FIRST RECORD ACCORDING TO THE ORDER OF THE PRIMARY KEY
   end
   
   def self.avatar_url(user, size)
     gravatar_id = Digest::MD5::hexdigest(user.email).downcase
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
   end
end