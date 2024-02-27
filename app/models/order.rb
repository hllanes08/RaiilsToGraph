# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  article_id :integer
#  total      :float
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Order < ApplicationRecord
  belongs_to :article
  belongs_to :user
end
