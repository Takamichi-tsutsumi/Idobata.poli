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

require 'rails_helper'

RSpec.describe ManifestRelation, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
