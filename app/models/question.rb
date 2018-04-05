class Question < ApplicationRecord
  has_many :answer, dependent: :destroy
end
