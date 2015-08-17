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
end
