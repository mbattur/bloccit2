class Topic < ActiveRecord::Base
    has_many :posts, dependent: :destroy
    has_many :sponsored_posts, dependent: :destroy
    has_many :labelings, as: :labelable
    has_many :labels, through: :labelings

    scope :publicaly_viewable, -> { where(public: true) }
    scope :privately_viewable, -> { where(public: false) }
    scope :visible_to, -> (user) { user ? all : publicaly_viewable }
end