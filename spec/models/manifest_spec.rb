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

require 'rails_helper'

RSpec.describe Manifest, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
