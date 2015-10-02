# == Schema Information
#
# Table name: manifest_relations
#
#  id                 :integer          not null, primary key
#  manifest_id        :integer
#  public_manifest_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryGirl.define do
  factory :manifest_relation do
    manifest_id 1
public_manifest_id 1
  end
end
