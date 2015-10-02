# == Schema Information
#
# Table name: public_manifests
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  content     :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

FactoryGirl.define do
  factory :public_manifest do
    title "MyString"
content "MyText"
  end

end
