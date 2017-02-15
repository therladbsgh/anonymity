module SubmissionsHelper

    def find_magic_word(magic_id)
        magics = Magic.find_by_id(magic_id)
        if magics != nil
            magics.magic_word
        else
            "???"
        end
    end

    def submission_with_user(magic_id)
        magics = Magic.find_by_id(magic_id)
        if magics != nil
            return magics.user_id == current_user.id
        else
            return false
        end
    end


end
