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

  def successfully?
    completed? && passed?
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

  def question_number
    test.questions.where('questions.id <= ?', current_question.id).count
  end

  def set_timer 
    if self.timer_present?
      return unless test.timer
      timer = test.timer

      self.time_end = Time.now + (timer * 60)
    end  
  end

  def set_timer!
    set_timer
    save!
  end

  def time_is_up?
    (self.time_end - Time.now).negative? if self.timer_present?
  end
  
  def timer_present?
    self.test.timer.present?
  end

  def badge_and_mailer
    if self.successfully?
      BadgeUserService.new(self).call
      TestsMailer.completed_test(self).deliver_now
    end  
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
