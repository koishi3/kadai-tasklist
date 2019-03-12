class Task < ApplicationRecord
    validates :status, presence: true, length: {maximum: 10}
    validates :title, presence: true
end
