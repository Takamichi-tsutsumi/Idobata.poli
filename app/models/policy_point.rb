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
end
