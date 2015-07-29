class Picture < ActiveRecord::Base
	belongs_to :user
	has_many :comments, class_name: 'PhotoComment'

	has_attached_file :attachment, style: {medium: "200x200", thumb: "100x100"}
	validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
end