module Middleman
  module Test

    class Extension < ::Middleman::Extension

      option :key,  'hodor', 'key for added resource'
      option :path, 'hodor', 'path of added resource'

    end
    ::Middleman::Extensions.register(:test, Middleman::Test::Extension)

  end
end
