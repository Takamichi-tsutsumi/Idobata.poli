# == Schema Information
#
# Table name: votes
#
#  id                 :integer          not null, primary key
#  user_id            :integer          not null
#  comment            :text(65535)
#  point              :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  public_manifest_id :integer
#

FactoryGirl.define do
  factory :vote do
    user_id 1
manifest_id 1
point false
  end

end
