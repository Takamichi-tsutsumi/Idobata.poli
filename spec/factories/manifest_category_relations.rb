# == Schema Information
#
# Table name: manifest_category_relations
#
#  id          :integer          not null, primary key
#  manifest_id :integer          not null
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :manifest_category_relation do
    manifest_id 1
category_id 1
  end

end
