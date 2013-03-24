require 'erb'

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
        children = filter_children(page.children, opts.slice(:extensions))

        if children.empty?
          ""
        else
          child_html = children.map do |child|
            my_opts = opts.dup
            my_opts[:current_depth] +=  1
            sub_list = list_pages(child, my_opts)
            li_for(child, sub_list, my_opts)
          end

          render('_list', binding)
        end
      end

      def li_for(page, sub_list=nil, opts={})
        active = (page.path == current_page.path)

        render('_list_item', binding)
      end

      private

      def render(path, bound)
        full_path = File.join(File.dirname(__FILE__), "#{path}.erb")
        template = ERB.new(File.read full_path)
        template.result bound
      end

      def filter_children(children, opts=nil)
        extensions = opts[:extensions] || ".html"
        extensions = Array(extensions)

        children.reject { |p| p.data.title.nil? }.select do |p|
          extensions.include? p.ext
        end
      end
    end
  end
end
