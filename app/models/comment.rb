class Comment < ApplicationRecord
  belongs_to :menu
  belongs_to :user 

  validates :comment_text, presence: true
end
