class Users::MatchingController < ApplicationController
  layout "users"

  def index
    @question_set = QuestionSet.where(:status => true).shuffle.first #公開中の質問セットをランダムで一つ持ってくる
    @answer = Answer.new(:question_set_id => @question_set.id)
  end

  def answer
    @answer = Answer.new(answer_params)
    @question_set = QuestionSet.find(answer_params[:question_set_id])
    if @answer.save
      @matched_parties_hash = @answer.match(@question_set)
      p @matched_parties_hash
      render :result
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:q1_ans,:q2_ans,:q3_ans,:q4_ans,:q5_ans,:q6_ans,:q7_ans,:q8_ans,:q9_ans,:q10_ans, :question_set_id)
  end
end
