class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :has_answers

  scope :correct, -> { where(correct: true) } 

  private

  def has_answers
    errors.add(:base, "Many answers") if (question && question.answers.size > 4)
  end
end
