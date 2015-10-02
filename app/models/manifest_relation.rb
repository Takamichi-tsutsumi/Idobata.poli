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

class ManifestRelation < ActiveRecord::Base
	belongs_to :manifest
	belongs_to :public_manifest
end

