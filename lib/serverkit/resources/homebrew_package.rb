require "serverkit/resources/package"

module Serverkit
  module Resources
    class HomebrewPackage < Package
      # @note Override to force to use brew command
      def apply
        run_command(
          ::Specinfra::Command::Darwin::Base::Package.install(
            name,
            version,
            options,
          ),
        )
      end

      # @note Override to force to use brew command
      def check
        check_command(
          ::Specinfra::Command::Darwin::Base::Package.check_is_installed(
            unnested_name,
            version,
          ),
        )
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
