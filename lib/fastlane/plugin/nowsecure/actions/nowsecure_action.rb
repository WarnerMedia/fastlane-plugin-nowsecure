# Copyright (c) Warner Media, LLC. All rights reserved. Licensed under the MIT license.
# See the LICENSE file for license information.

require 'fastlane/action'
require 'fastlane_core/configuration/config_item'
require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?(:UI)

  module Actions
    module SharedValues
    end

    # NowSecure Upload Application API:
    # https://support.nowsecure.com/hc/en-us/articles/4422142622733-Applications-REST-API#h_01FYPZHMEZK1GZCYW9BVB7BH8G

    class UploadToNowsecureAction < Action
      def self.run(params)
        # NowSecure token
        nowsecure_token = params[:nowsecure_token]
        # NowSecure group ID
        nowsecure_group_id = params[:nowsecure_group_id]
        # File path of app to upload to NowSecure
        nowsecure_app_path = params[:nowsecure_app_path]
        # the tenant endpoint for NowSecure
        nowsecure_endpoint = params[:nowsecure_endpoint]

        UI.success("Uploading app to NowSecure")
        UI.success("This might take a few minutes. Please don't interrupt.")
        cmd = "curl --request POST \
        --url \"#{nowsecure_endpoint}/build/?group=#{nowsecure_group_id}\" \
        --header \"Authorization: Bearer #{nowsecure_token}\" \
        --header \"Content-Type: application/binary\" \
        --header \"Cache-Control: no-cache\" \
        --silent --show-error --fail \
        --output nowsecure_response.json \
        --data-binary \"@#{nowsecure_app_path}\""
        `#{cmd}`
        # Check exit code
        if $?.exitstatus != 0
          UI.shell_error!("🚫 NowSecure upload failed. Curl exit code #{$?.exitstatus}. See URL for meaning: https://everything.curl.dev/usingcurl/returns#available-exit-codes")
        end
        UI.success("✅ Successfully uploaded app to NowSecure")
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Fastlane plugin for NowSecure"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :nowsecure_token,
            env_name: "NOWSECURE_TOKEN",
            description: "NowSecure token",
            optional: false,
            verify_block: proc do |value|
              UI.user_error!("NowSecure token environment variable `NOWSECURE_TOKEN` is empty or not set") unless value && !value.empty?
            end),
          FastlaneCore::ConfigItem.new(key: :nowsecure_group_id,
            env_name: "NOWSECURE_GROUP_ID",
            description: "NowSecure group ID",
            optional: false,
            verify_block: proc do |value|
              UI.user_error!("NowSecure Group ID environment variable `NOWSECURE_GROUP_ID` is empty or not set") unless value && !value.empty?
            end),
          FastlaneCore::ConfigItem.new(key: :nowsecure_app_path,
            env_name: "NOWSECURE_APP_PATH",
            description: "File path of app to upload to NowSecure",
            optional: false,
            verify_block: proc do |value|
              UI.user_error!("Could not find a file at '#{value}'") unless File.exist?(value)
            end),
          FastlaneCore::ConfigItem.new(key: :nowsecure_endpoint,
            env_name: "NOWSECURE_ENDPOINT",
            description: "NowSecure Tenant Endpoint",
            optional: true,
            default_value: "https://lab-api.nowsecure.com",
            type: String
        ]
      end

      def self.authors
        ["Andy Obusek | GitHub: @obuseme | Twitter: @obusek",
         "Onyx Mueller | GitHub: @onyxmueller | Twitter: @onyx"]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
