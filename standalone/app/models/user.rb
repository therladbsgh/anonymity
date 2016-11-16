class User < ActiveRecord::Base

    has_secure_password

    def teacher?
        self.rank == 'teacher'
    end

    has_many :classrooms
    has_many :courses, through: :classrooms
    has_many :comments

end
