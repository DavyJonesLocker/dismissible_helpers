class DismissibleHelpers::DismissedHelpersExtractor

  def self.extract(*args)
    self.new(*args).extract
  end

  def initialize(user, cookie)
    @user = user
    @cookie = cookie
  end

  def extract
    if @user && @user.respond_to?(:dismissed_helpers)
      @user.dismissed_helpers
    else
      if @cookie.present?
        @cookie.split '|'
      else
        []
      end
    end
  end

end
