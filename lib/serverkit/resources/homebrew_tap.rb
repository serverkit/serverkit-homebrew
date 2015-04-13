require "serverkit/resources/base"

module Serverkit
  module Resources
    class HomebrewTap < Base
      attribute :name, required: true, type: String
      attribute :status, type: String, inclusion: { allow_nil: true, in: ["untapped"] }

      # @note Override
      def apply
        run_command("brew #{applied_action_name} #{name}")
      end

      # @note Override
      def check
        has_untapped_status? ^ check_command("brew tap | grep -E '^#{name}$'")
      end

      private

      # @return [String]
      def applied_action_name
        if has_untapped_status?
          "untap"
        else
          "tap"
        end
      end

      # @note Override
      def default_id
        name
      end

      def has_untapped_status?
        status == "untapped"
      end
    end
  end
end
