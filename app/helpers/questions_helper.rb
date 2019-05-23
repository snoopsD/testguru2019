module QuestionsHelper
  def question_header(question)
    action = question.new_record? ? t('create') : t('edit')
    "#{action} #{question.class.model_name.human} #{question.test&.title} "
  end
end
