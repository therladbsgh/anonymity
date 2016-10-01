class Submission < ActiveRecord::Base

    belongs_to :assignment
    has_many :comments
    has_one :magic

end
