# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  content    :text(65535)
#  note       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base

  validates :content,
    presence: true,
    uniqueness: true

  has_many :policy_points
  has_many :political_parties, :through => :policy_points

  # Takamichi Tsutsumi
  # 質問新規作成時にpolicy_pointsを初期化
  def init_policy_points
    political_parties = PoliticalParty.all
    political_parties.each do |party|
      party.policy_points.create(question_id: self.id, point: 0)
    end
  end

  # Takamichi Tsutsumi
  # partyを受け取ってquestionのpointを渡す
  def point(party)
    PolicyPoint.where(:question_id => self.id, :political_party_id => party.id).first.point
  end
end
