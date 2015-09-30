module Middleman
  module Test

    class Extension < ::Middleman::Extension

      option :key,  'hodor', 'key for added resource'

      def manipulate_resource_list resources
        # as a quick silly example, lets duplicate the first resource
        # but initialize it as a TestResource
        first_resource = resources.first
        new_resource   = TestResource.new first_resource.store, File.join('dup', first_resource.path), first_resource.source_file

        new_resource.add_metadata key: options.key

        resources + [new_resource]
      end

    end

    ::Middleman::Extensions.register(:test) do
      require_relative "extension/test_resource"
      Middleman::Test::Extension
    end

  end
end
