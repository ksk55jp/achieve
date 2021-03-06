class Comment < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :user
  belongs_to :blog

  has_many :notification, dependent: :destroy

  def push(channelname, eventname, content, currentuser_id, commentuser_id)
    Rails.logger.info "[ACHIEVE LOG] Modelfunction notify in"
    Rails.logger.info "[ACHIEVE DEBUG] currentuser_id is #{currentuser_id}, and commentuser_id is #{commentuser_id}"
    unless currentuser_id == commentuser_id
      Rails.logger.info "[ACHIEVE LOG]    unless condition in"
      Pusher.trigger(channelname,eventname,
        content
      )
    end
    Rails.logger.info "[ACHIEVE LOG] Modelfunction notify out"
  end
end
