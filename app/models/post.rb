class Post < ApplicationRecord
  belongs_to :user
  enum status: %w(draft reviewed active)

  before_save :set_defaults

  protected

    def set_defaults
      self.slug = [id, name.parameterize].join("-") if slug.blank?
    end
end
