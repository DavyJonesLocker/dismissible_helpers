module DismissibleHelpers::Helpers::DismissibleHelpers
  def render_dismissible_helper(name)
    unless has_been_dismissed?(name)
      DismissibleHelpers::ContentBuilder.build(name)
    end
  end

  private

  def has_been_dismissed?(name)
    if respond_to?(:current_user) && current_user && current_user.respond_to?(:dismissed_helpers)
      dismissed_helpers = current_user.dismissed_helpers
    else
      if cookies[:dismissed_helpers].present?
        dismissed_helpers = cookies[:dismissed_helpers].split '|'
      else
        dismissed_helpers = []
      end
    end
    dismissed_helpers.include? name
  end
end
