# == Schema Information
#
# Table name: question_sets
#
#  id         :integer          not null, primary key
#  q1_id      :integer
#  q2_id      :integer
#  q3_id      :integer
#  q4_id      :integer
#  q5_id      :integer
#  q6_id      :integer
#  q7_id      :integer
#  q8_id      :integer
#  q9_id      :integer
#  q10_id     :integer
#  status     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :question_set do
    q1_id 1
status false
  end

end
