class RemoveIndexCurrentQuestionId < ActiveRecord::Migration[5.2]
  def change
    remove_index :test_passages, name: "index_test_passages_on_current_question_id" 
  end
end
