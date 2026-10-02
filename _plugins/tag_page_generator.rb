module SamplePlugin
  class CategoryPageGenerator < Jekyll::Generator
    safe true

    def generate(site)
      site.tags.each do |tag, posts|
        site.pages << TagPage.new(site, tag, posts)
      end
    end
  end

  # Subclass of `Jekyll::Page` with custom method definitions.
  class TagPage < Jekyll::Page
    def initialize(site, tag, posts)
      @site = site             # the current site instance.
      @base = site.source      # path to the source directory.
      @dir  = tag              # the directory the page will reside in.

      @basename = 'index'      # filename without the extension.
      @ext      = '.html'      # the extension.
      @name     = 'index.html' # basically @basename + @ext.

      @data = {
        'linked_docs' => posts,
        'tag' => tag
      }

      data.default_proc = proc do |_, key|
        site.frontmatter_defaults.find(relative_path, :tags, key)
      end
    end

    # Placeholders that are used in constructing page URL.
    def url_placeholders
      {
        path: @dir,
        tag: @dir,
        basename: basename,
        output_ext: output_ext
      }
    end
  end
end
