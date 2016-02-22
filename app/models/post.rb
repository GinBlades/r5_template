class Post < ApplicationRecord
  belongs_to :user
  enum status: %w(draft reviewed active)
end
