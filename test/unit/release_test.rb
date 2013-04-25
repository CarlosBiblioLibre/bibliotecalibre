# == Schema Information
#
# Table name: releases
#
#  id         :integer          not null, primary key
#  location   :string(255)
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ReleaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
