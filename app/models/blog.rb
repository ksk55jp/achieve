class Blog < ActiveRecord::Base
	validates :title, presence: true
  belongs_to :user
  #DIVE15: Comment
  has_many :comments, dependent: :destroy
end
