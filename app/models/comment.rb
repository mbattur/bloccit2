class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  
  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
  
  after_create :send_favorite_emails
 
  private
 
  def send_favorite_emails
    post.favorites.each do |favorite|
      FavoriteMailer.new_comment(favorite.user, post, self).deliver_now
    end
  end
  #sending an email notification to a user when their comment is favorited. 
  #it will loop over each favorites and create and send email for each one of them.
end
