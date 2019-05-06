class TestPassage < ApplicationRecord
  THRESHOLD = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_next_question

  def completed?
    current_question.nil?
  end
  
  def success_rate
    ( self.correct_questions.to_f * 100 ) / self.test.questions.count
  end

  def passed?
    success_rate >= THRESHOLD
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  private 

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_next_question
    self.current_question  = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

end
