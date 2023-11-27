class InputData < ApplicationRecord
  validates :name, presence: true
  validates :agree_to_terms, presence: true
end