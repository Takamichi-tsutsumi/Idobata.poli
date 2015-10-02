module Admin::QuestionSetsHelper

  # Takamichi Tsutsumi
  # question_setのidとインデックスから質問を取ってくる
  def question_content(set_id, i)
    id = QuestionSet.find(set_id).__send__("q" + i.to_s + "_id")
    Question.find(id).content
  end
end
