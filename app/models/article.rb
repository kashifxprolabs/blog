class Article < ApplicationRecord
	validates :text, presence: true, length: { minimum: 4}
	validates :title, presence: true, length: {minimum: 4}
end
