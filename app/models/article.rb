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
class Article < ApplicationRecord
  has_many :orders
end
