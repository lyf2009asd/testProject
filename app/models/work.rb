class Work < ApplicationRecord
    belongs_to :user
    # validates_associated :user
end
