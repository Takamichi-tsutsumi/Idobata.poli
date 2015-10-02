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

class PublicManifest < ActiveRecord::Base
  has_many :manifests, :through => :manifest_relations
  has_many :votes
  belongs_to :category
  has_one :manifest_relation
end

