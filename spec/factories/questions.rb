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

FactoryGirl.define do
  factory :question do
    content "MyText"
note "MyText"
  end

end
