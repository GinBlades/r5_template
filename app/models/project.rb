class Project < ApplicationRecord
  enum status: %w(active inactive completed planned)

  before_save :set_defaults

  protected

    def set_defaults
      self.slug = [id, name.parameterize].join("-") if slug.blank?
    end
end
