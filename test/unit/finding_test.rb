# == Schema Information
#
# Table name: findings
#
#  id         :integer          not null, primary key
#  location   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer
#  how        :string(255)
#  username   :string(255)
#  email      :string(255)
#

require 'test_helper'

class FindingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
