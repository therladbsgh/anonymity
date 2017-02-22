class Submission < ActiveRecord::Base

    belongs_to :assignment
    has_many :comments
    has_one :magic

    mount_uploader :content, HandinUploader

end
