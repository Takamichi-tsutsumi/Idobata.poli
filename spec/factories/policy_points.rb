# == Schema Information
#
# Table name: policy_points
#
#  id                 :integer          not null, primary key
#  question_id        :integer
#  political_party_id :integer
#  point              :float(24)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryGirl.define do
  factory :policy_point do
    question_id 1
party_id 1
point 1.5
  end

end
