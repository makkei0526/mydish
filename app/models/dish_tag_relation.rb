# == Schema Information
#
# Table name: dish_tag_relations
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  dish_id    :bigint
#  tag_id     :bigint
#
# Indexes
#
#  index_dish_tag_relations_on_dish_id  (dish_id)
#  index_dish_tag_relations_on_tag_id   (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (dish_id => dishes.id)
#  fk_rails_...  (tag_id => tags.id)
#
class DishTagRelation < ApplicationRecord
  belongs_to :dish
  belongs_to :tag
end
