class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  scope :correct, -> { where(correct: true) }

  validate :has_answers

  private

  def has_answers
     if ( question && question.answers.size < 1 )
       errors.add(:base, "No answer") 
     elsif ( question && question.answers.size > 4 )
       errors.add(:base, "Many answers")
     end  
  end
end
