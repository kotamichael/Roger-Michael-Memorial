class Micropost < ApplicationRecord
	belongs_to :user
	default_scope -> { order(created_at: :desc) }
	mount_uploader :picture, PictureUploader
	validates :user_id, presence: true
	validates :content, presence: true, length: { maximum: 500 }
	validate  :picture_size

	private

	    # Validates the size of an uploaded picture.
	    def picture_size
			if picture.size > 20.megabytes
				errors.add(:picture, "should be less than 20MB")
			end
	    end
end
