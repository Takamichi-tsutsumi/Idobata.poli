# == Schema Information
#
# Table name: political_parties
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  detail     :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PoliticalParty < ActiveRecord::Base

  validates :name,
    :presence => true,
    :uniqueness => true
  validates :detail,
    :presence => true

  has_many :policy_points, :dependent => :destroy
  accepts_nested_attributes_for :policy_points
  has_many :questions, :through => :policy_points

  def check_policy_point
    question_ids = Question.all.map {|q| q.id}
    policy_points_question_ids = self.policy_points.map {|point| point.question_id}
    id_not_exist_in_party = []
    question_ids.each do |q_id|
      id_not_exist_in_party << q_id unless policy_points_question_ids.include?(q_id)
    end
    id_not_exist_in_party.each do |id|
      self.policy_points.create(:question_id => id, :point => 0)
    end
  end
end
