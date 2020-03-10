# == Schema Information
#
# Table name: dishes
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  name       :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Dish < ApplicationRecord
  has_many :comments, dependent: :delete_all
  has_many :dish_tag_relations, dependent: :delete_all
  has_many :tags, through: :dish_tag_relations
  has_one_attached :image
  belongs_to :user

  validates :name, presence: true, length: { maximum: 10 }
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 1000 }
end
