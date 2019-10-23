class Message < ApplicationRecord
    belongs_to :friendship
    belongs_to :user

    def format_time
        created_at.strftime("%d/%m/%y at %l:%M %p")
      end

      def format_time_for_sort
        created_at.strftime("%y%m%d%k%M%S").to_i
      end
end
