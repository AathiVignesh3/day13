class Task < ApplicationRecord
    belongs_to :user

    # after_save_commit do 
    #     if due_date_previously_changed?
    #     DuedateJob.set(wait_until: due_date.to_s).perform_later(self)
    #     end        
    # end
end
