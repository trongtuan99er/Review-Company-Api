module WhoDoesIt::CurrentUserMethods
  extend ActiveSupport::Concern

  included do
    class << self
      def current_user
        Thread.current[:user]
      end

      def current_user=(user)
        Thread.current[:user] = user
      end

      def reset_current_user
        Thread.current[:user] = nil
      end
    end
  end

end
