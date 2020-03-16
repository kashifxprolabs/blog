class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    if record.title == "Evil" || record.text == "kashif"
      record.errors[:base] << "This person is evil"
    end
  end
end
class Article < ApplicationRecord
	validates_with GoodnessValidator
	has_many :comments, dependent: :destroy
	validates_each :title do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') 
    	if value =~ /\A[[:lower:]]/
    	end
  	end
	validates_associated :comments
	validates :text, exclusion: { in: %w(www us ca jp), message: "%{value} is not allowed" }
    validates :text, length: { maximum: 10,
    too_long: "%{count} characters is the maximum allowed" }
    validates :title, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
    validates :text, inclusion: { in: %w(small medium large),
    message: "%{value} is not a valid size" }, allow_blank: true
    validates :title, uniqueness: true
	validates :text, length: { minimum: 4}
	validates :title, presence: true, length: {minimum: 4}
end
