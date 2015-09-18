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

require 'rails_helper'

RSpec.describe ManifestCategoryRelation, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
