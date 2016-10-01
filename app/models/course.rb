class Course < ActiveRecord::Base

    has_many :classrooms
    has_many :users, through: :classrooms
    has_many :assignments

end
