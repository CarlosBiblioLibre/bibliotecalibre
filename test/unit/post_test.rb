# == Schema Information
#
# Table name: posts
#
#  id                         :integer          not null, primary key
#  title                      :string(255)
#  content                    :text
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  picture_file_name          :string(255)
#  picture_content_type       :string(255)
#  picture_file_size          :integer
#  picture_updated_at         :datetime
#  small_picture_file_name    :string(255)
#  small_picture_content_type :string(255)
#  small_picture_file_size    :integer
#  small_picture_updated_at   :datetime
#  description                :text
#  kind                       :string(255)
#  bajada                     :text
#  autor                      :text
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
