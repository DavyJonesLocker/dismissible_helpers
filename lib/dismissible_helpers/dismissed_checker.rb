class DismissibleHelpers::DismissedChecker

  def self.dismissed?(*args)
    self.new(*args).dismissed?
  end

  def initialize(key, user=nil, dismissed=nil)
    @key = key
    @dismissed_helpers = DismissibleHelpers::DismissedHelpersExtractor.
      extract(user, dismissed)
  end

  def dismissed?
    dismissed_helpers.include? @key
  end

  private

  def dismissed_helpers
    @dismissed_helpers
  end

end
