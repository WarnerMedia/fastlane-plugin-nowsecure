# Copyright (c) Warner Media, LLC. All rights reserved. Licensed under the MIT license.
# See the LICENSE file for license information.

require 'fastlane/plugin/nowsecure/version'

module Fastlane
  module Nowsecure
    # Return all .rb files inside the "actions" and "helper" directory
    def self.all_classes
      Dir[File.expand_path('**/{actions}/*.rb', File.dirname(__FILE__))]
    end
  end
end

# By default we want to import all available actions and helpers
# A plugin can contain any number of actions and plugins
Fastlane::Nowsecure.all_classes.each do |current|
  require current
end
