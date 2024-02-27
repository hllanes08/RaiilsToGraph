# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  name       :string
#  price      :float
#  brand      :string
#  stock      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
