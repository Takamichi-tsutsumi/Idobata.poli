# == Schema Information
#
# Table name: answers
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  question_set_id :integer
#  q1_ans          :integer
#  q2_ans          :integer
#  q3_ans          :integer
#  q4_ans          :integer
#  q5_ans          :integer
#  q6_ans          :integer
#  q7_ans          :integer
#  q8_ans          :integer
#  q9_ans          :integer
#  q10_ans         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question_set

  # question_setを引数にとって政党とのマッチ度をハッシュで返す
  def match(question_set)
    parties = PoliticalParty.all
    matched_parties = {}
    parties.each do |party|
      matched_point = 0
      (1..10).each do |i|
        question = Question.find(question_set.__send__("q"+i.to_s+"_id"))
        matched_point += question.point(party) * self.__send__("q"+i.to_s+"_ans").to_i
      end
      matched_parties[party.name] = matched_point 
    end
    matched_parties = matched_parties.sort_by {|key, val| val}.reverse
  end
end
