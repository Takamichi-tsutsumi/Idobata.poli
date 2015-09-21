# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  type       :integer          not null
#  name       :string(255)      not null
#  content    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  has_many :manifest_category_relations
  has_many :manifests, :through => :manifest_category_relations
end

