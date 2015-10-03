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

class PolicyPoint < ActiveRecord::Base

  validates :point,
    presence: true,
    numericality: {
      greater_than_or_equal_to: -5.0,
      less_than_or_equal_to: 5.0
    }
  validates :question_id,
    presence: true,
    uniqueness: {scope: :political_party_id}
  validates :political_party_id,
    presence: true

  belongs_to :political_party
  belongs_to :question
end
