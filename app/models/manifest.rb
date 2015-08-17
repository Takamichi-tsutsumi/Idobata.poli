# == Schema Information
#
# Table name: manifests
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  content    :text(65535)      not null
#  importance :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Manifest < ActiveRecord::Base
  belongs_to :user
  has_many :manifest_category_relations
  has_many :categories, :through => :manifest_category_relations
  has_many :votes
end
