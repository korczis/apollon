# encoding: UTF-8

module Apollon
  # Interface for puppet
  class Puppet
    class << self
      def relative_files(dir, relative_dir)
        Dir.glob(dir).map do |f|
          full_path = File.expand_path(f)
          rel_path = full_path.gsub(relative_dir + '/', '')
          name = rel_path.gsub(/\.pp$/, '').split('/')[0]
          {
            name: name,
            rel: full_path.gsub(BASE_DIR + '/', ''),
            path: full_path
          }
        end
      end

      def manifests(dir = MANIFEST_DIR + PUPPET_MANIFEST_PATTERN)
        relative_files(dir, MANIFEST_DIR)
      end

      def modules(dir = MODULE_DIR + PUPPET_MODULE_PATTERN)
        relative_files(dir, MODULE_DIR)
      end
    end
  end
end
