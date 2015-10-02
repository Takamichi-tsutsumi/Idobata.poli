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

class Vote < ActiveRecord::Base
  belongs_to :users
  belongs_to :public_manifest
  POINT = {
  	'賛成' => 1,
  	'反対' => -1,
  	'中立' => 0
  }
end
