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
  has_many :policy_points
  has_many :questions, :through => :policy_points
end
