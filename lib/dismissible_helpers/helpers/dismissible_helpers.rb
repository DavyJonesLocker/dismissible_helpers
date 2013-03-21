module DismissibleHelpers::Helpers::DismissibleHelpers

  def render_dismissible_helper(name, options = {}, &block)
    contents = block_given? ? capture(&block) : nil
    restorable = options.fetch(:restorable) { false }
    builder = restorable ? DismissibleHelpers::RestorableContentBuilder : DismissibleHelpers::ContentBuilder
    builder.build(name, contents, options.merge({ dismissed: dismissed?(name) }))
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
