# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string(255)      not null
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  profile_photo   :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#
class User < ApplicationRecord
  has_secure_password

  has_many :dishes

  validates :name,
  presence: true,
  uniqueness: true,
  length: { maximum: 16 }
  # format: {
  #   with: /\A[a-z0-9]+\z/,
  #   message: 'は小文字英数字で入力してください'
  # }
validates :password,
  length: { minimum: 8 }
  
  validates :email,
  presence: true,
  uniqueness: true
end
