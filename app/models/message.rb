class Message < ApplicationRecord
    belongs_to :friendship
    belongs_to :user
end
