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

require 'rails_helper'

RSpec.describe PolicyPoint, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
