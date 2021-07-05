class Comment < ApplicationRecord

	belongs_to :record

	validates :add_comment, presence: true

end