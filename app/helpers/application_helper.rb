module ApplicationHelper
    def words_form_action(word)
        if word.new_record?
          @action = "/words"
        else
          @action = "/words/#{word.id}"      
        end
        @action
      end
      
      def words_form_method(word)
        if word.new_record?
          @method = "post"
        else
          @method = "put"
        end
        @method
      end
end
