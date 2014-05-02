# == Schema Information
#
# Table name: battles
#
#  id                         :integer          not null, primary key
#  title                      :string(255)
#  content                    :text
#  book1                      :string(255)
#  book2                      :string(255)
#  book1_count                :integer
#  book2_count                :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  picture_file_name          :string(255)
#  picture_content_type       :string(255)
#  picture_file_size          :integer
#  picture_updated_at         :datetime
#  book1_picture_file_name    :string(255)
#  book1_picture_content_type :string(255)
#  book1_picture_file_size    :integer
#  book1_picture_updated_at   :datetime
#  book2_picture_file_name    :string(255)
#  book2_picture_content_type :string(255)
#  book2_picture_file_size    :integer
#  book2_picture_updated_at   :datetime
#

require 'test_helper'

class BattleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
