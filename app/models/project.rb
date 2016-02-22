class Project < ApplicationRecord
  enum status: %w(active inactive completed planned)
end
