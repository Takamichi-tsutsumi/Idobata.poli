module Users::MatchingHelper
  # question_idから質問を取ってくる
  def question(id)
    Question.find(id).content
  end
end
