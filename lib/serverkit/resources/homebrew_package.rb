require "serverkit/resources/package"

module Serverkit
  module Resources
    class HomebrewPackage < Package
      # @note Override to use unnested name
      def check
        check_command_from_identifier(:check_package_is_installed, unnested_name, version)
      end

      private

      # @return [String]
      # @example "brew-cask" # for "caskroom/cask/brew-cask"
      def unnested_name
        name.split("/").last
      end
    end
  end
end
