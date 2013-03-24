module Middleman
  module ListPages
    class << self
      def registered(app)
        app.helpers HelperMethods
      end
      alias :included :registered
    end

    module HelperMethods
      def list_pages(page=nil, opts={})
        opts[:depth] ||= -1
        opts[:current_depth] ||= 1
        if opts[:depth] > -1
          return "" if (opts[:current_depth] > opts[:depth])
        end

        page ||= sitemap.find_resource_by_destination_path('index.html')
        children = filter_children(page.children, opts[:extensions])

        if children.empty?
          ""
        else
          opts[:current_depth] +=  1
          child_html = children.map { |child| li_for(child, opts.dup) }
          "<ul>#{child_html.join}</ul>"
        end
      end

      def li_for(page, opts={})
        child_html = list_pages(page, opts)
        active = (page.path == current_page.path)

        "<li class='#{active ? "active" : ""}'>#{link_to page.data.title, page}#{child_html}</li>"
      end

      def filter_children(children, extensions=nil)
        extensions ||= ".html"
        extensions = Array(extensions)

        children.reject { |p| p.data.title.nil? }.select do |p|
          extensions.include? p.ext
        end
      end
    end
  end
end
