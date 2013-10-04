module DismissibleHelpers
  class RestorableContentBuilder < ContentBuilder
    def build_markup
      return [content_str, open_str, close_str].join.html_safe
    end

    protected

    def restorable?
      return true
    end

    def open_str
      content_tag(:a, I18n.t(:"dismissible_helpers.actions.open"), :class => 'open', style: (dismissed? ? '' : 'display: none'), :href => '#')
    end

    def content_str
      @content_str ||= begin
        content = if @contents
                    @contents
                  else
                    t(@name)
                  end
        content_tag :div, content, style: (dismissed? ? 'display: none' : '')
      end
    end

    def close_str
      content_tag(:a, I18n.t(:"dismissible_helpers.actions.close"), :class => 'close', style: (dismissed? ? 'display: none' : ''), :href => '#')
    end
  end
end
