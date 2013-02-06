module DismissibleHelpers::Helpers::DismissibleHelpers

  def render_dismissible_helper(name)
    unless dismissed?(name)
      DismissibleHelpers::ContentBuilder.build(name)
    end
  end

  private

  def dismissed?(name)
    DismissibleHelpers::DismissedChecker.dismissed?(
      name,
      current_user,
      cookies[:dismissed_helpers]
    )
  end

end
