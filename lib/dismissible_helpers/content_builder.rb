class DismissibleHelpers::ContentBuilder
  include ActionView::Context
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::TranslationHelper

  def self.build(*args)
    self.new(*args).build
  end

  def initialize(name, &block)
    @name = name
    @block = block
  end

  def build
    options = {}
    options[:class] = 'dismissible'
    options[:data] = {:dismissible_name => @name}
    content_tag :div, options do
      html = t(@name)
      html << "\n"
      html << content_tag(:a, 'Close', :class => 'close', :href => '#')
      html.html_safe
    end
  end

end
