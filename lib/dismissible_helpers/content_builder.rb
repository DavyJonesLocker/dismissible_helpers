class DismissibleHelpers::ContentBuilder
  include ActionView::Context
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::TranslationHelper

  def self.build(*args)
    self.new(*args).build
  end

  def initialize(name, contents=nil, options={})
    @name = name
    @contents = contents
    @options = options
  end

  def build
    options = {}
    options[:class] = 'dismissible'
    options[:data] = {:dismissible_name => @name, :restorable => restorable?}
    html = build_markup
    content_tag :div, html, options
  end

  def build_markup
    return [content_str, dismissed? ? '' : close_str].join.html_safe
  end

  protected

  def restorable?
    return false
  end

  def dismissed?
    return @options[:dismissed]
  end

  def content_str
    @content_str ||= begin
      content = if @contents
                  @contents
                else
                  t(@name)
                end
      dismissed? ? nil : content
    end
  end

  def close_str
    content_tag(:a, I18n.t(:"dismissible_helpers.actions.close"), :class => 'close', :href => '#')
  end
end
