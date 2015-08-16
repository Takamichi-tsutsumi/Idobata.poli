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

FactoryGirl.define do
  factory :answer do
    user_id 1
question_set_id 1
q1_ans 1
  end

end
