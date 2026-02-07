class Tweet < ApplicationRecord
    validates :message, presence: true, length: {minimum: 10, maximum: 20}, uniqueness: true
end