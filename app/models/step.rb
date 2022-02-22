class Step < ApplicationRecord
  belongs_to :menu

  validates :step_number, presence: true
  validates :step_text, presence: true
end
