module TechRadar
  module Rendering
    class Markdown
      def initialize
        require 'redcarpet'
        renderer = Redcarpet::Render::HTML.new(
              filter_html: true,
                no_styles: true,
          safe_links_only: true
        )
        @markdown = Redcarpet::Markdown.new(renderer,
                                            no_intra_emphasis: true,
                                                       tables: true,
                                           fenced_code_blocks: true,
                                                     autolink: true,
                                 disable_indented_code_blocks: true,
                                                strikethrough: true,
                                                  superscript: true)
      rescue LoadError => ex
        raise "Since you speecified markdown rendering, you must include the redcarpet gem in your app: #{ex.message}"
      end

      def render_text(text)
        @markdown.render(text).html_safe
      end
    end
  end
end
