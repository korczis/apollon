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
        Dir.glob(dir).map { |f| File.expand_path(f, relative_dir) }
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
