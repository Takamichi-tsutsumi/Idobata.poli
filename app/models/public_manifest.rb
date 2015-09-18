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
end
