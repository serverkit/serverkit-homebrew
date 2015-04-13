require "serverkit/resources/base"

module Serverkit
  module Resources
    class HomebrewCaskPackage < Base
      attribute :name, required: true, type: String
      attribute :options, type: String

      # @note Override
      def apply
        run_command("brew cask install #{options} #{name}")
      end

      # @note Override
      def check
        check_command("brew cask list -1 | grep -E '^#{name}$'")
      end

      private

      # @note Override
      def default_id
        name
      end
    end
  end
end
