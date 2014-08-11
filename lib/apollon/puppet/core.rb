# encoding: UTF-8

module Apollon
  # Interface for puppet
  class Puppet
    BASE_DIR ||= File.absolute_path(File.join(File.dirname(__FILE__),
                                              '..',
                                              '..',
                                              '..'))
    PUPPET_DIR ||= File.join(BASE_DIR, 'data', 'puppet')
    MODULE_DIR ||= File.join(PUPPET_DIR, 'modules')
    MANIFEST_DIR ||= File.join(PUPPET_DIR, 'manifests')

    PUPPET_MANIFEST_PATTERN = '/*'
    PUPPET_MODULE_PATTERN = '/*'

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
