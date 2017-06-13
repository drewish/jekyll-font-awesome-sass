require 'jekyll-font-awesome-sass/version'
require 'find'

# Require font-awesome-sass to add font-awesome to SaSS's load path
require 'font-awesome-sass'

module Jekyll
  module FontAwesomeSass
    class Generator < Jekyll::Generator
      def generate(site)
        @site = site

        # Add our static files to Jekyll's native static file support
        @site.static_files.concat static_files if assets_enabled?
      end

      private

      # Has the user explictly disabled asset support by adding
      # The following to their `_config.yml` file:
      #
      # font-awesome
      #   assets: false
      def assets_enabled?
        return false if @site.config['font-awesome'].nil?
        @site.config['font-awesome']['assets'] == true
      end

      # Returns an array of Jekyll::StaticFile instances for each file
      # in asset_files. Files are prefixed with an `assets/` directory
      def static_files
        source = File.dirname(assets_path)
        asset_files.map do |file|
          dir = File.dirname(file)
          file_name = File.basename(file)
          Jekyll::StaticFile.new @site, source, dir, file_name
        end
      end

      # Return an array of paths to static files that should be included
      # in the generated site.
      #
      # Note: All paths are relative to the assets_path directory
      def asset_files
        asset_files = []
        Find.find(assets_path).each do |path|
          next if File.directory?(path)
          next if path.include?(stylesheets_path)
          asset_files << path.sub(assets_path, 'assets')
        end
        asset_files
      end

      # Absolute path to font-awesome-sass's vendored static assets
      def assets_path
        @assets_path ||= FontAwesome::Sass.assets_path
      end

      # Absolute path to font-awesome-sass's stylesheets directory
      # Which should be excluded because it's processed by SaSS
      def stylesheets_path
        @stylesheets_path ||= File.expand_path 'stylesheets/', assets_path
      end
    end
  end
end
