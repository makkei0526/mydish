# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  comment    :text(65535)      not null
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  dish_id    :bigint
#
# Indexes
#
#  index_comments_on_dish_id  (dish_id)
#
# Foreign Keys
#
#  fk_rails_...  (dish_id => dishes.id)
#
class Comment < ApplicationRecord
  belongs_to :dish

  validates :name, presence: true, length: { maximum: 10 }
  validates :comment, presence: true, length: { maximum: 1000 }
end
