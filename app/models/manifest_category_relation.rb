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

class ManifestCategoryRelation < ActiveRecord::Base
  belongs_to :manifest
  belongs_to :category
end
