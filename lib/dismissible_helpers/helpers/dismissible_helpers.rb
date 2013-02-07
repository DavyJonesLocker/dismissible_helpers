module DismissibleHelpers::Helpers::DismissibleHelpers

  def render_dismissible_helper(name, &block)
    unless dismissed?(name)
      DismissibleHelpers::ContentBuilder.build(name, block)
    end
  end

  private

  def dismissed?(name)
    user = respond_to?(:current_user) ? current_user : nil
    DismissibleHelpers::DismissedChecker.dismissed?(
      name,
      user,
      cookies[:dismissed_helpers]
    )
  end

end
