class DismissibleHelpers::ContentBuilder
  include ActionView::Context
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::TranslationHelper

  def self.build(*args)
    self.new(*args).build
  end

  def initialize(name, contents=nil)
    @name = name
    @contents = contents
  end

  def build
    options = {}
    options[:class] = 'dismissible'
    options[:data] = {:dismissible_name => @name}
    html = [content_str, close_str].join.html_safe
    content_tag :div, html, options
  end

  private

  def content_str
    @content_str ||= if @contents
                       @contents
                     else
                       t(@name)
                     end
  end

  def close_str
    content_tag(:a, I18n.t(:"dismissible_helpers.actions.close"), :class => 'close', :href => '#')
  end

end
