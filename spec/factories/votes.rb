# == Schema Information
#
# Table name: votes
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  manifest_id :integer          not null
#  comment     :text(65535)
#  point       :boolean          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :vote do
    user_id 1
manifest_id 1
point false
  end

end
