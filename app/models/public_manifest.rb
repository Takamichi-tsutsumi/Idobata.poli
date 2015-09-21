# == Schema Information
#
# Table name: public_manifests
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PublicManifest < ActiveRecord::Base
  has_many :manifests, :through => :manifest_relations
<<<<<<< HEAD
  has_many :votes
=======
>>>>>>> 2dad334c17704f005955953419df41c8496cc825
end
