require "serverkit/resources/base"

module Serverkit
  module Resources
    class HomebrewTap < Base
      attribute :name, required: true, type: String
      attribute :state, type: String, inclusion: { allow_nil: true, in: ["untapped"] }

      # @note Override
      def apply
        run_command("brew #{applied_action_name} #{name}")
      end

      # @note Override
      def check
        has_untapped_state? ^ check_command("brew tap | grep -E '^#{name}$'")
      end

      private

      # @return [String]
      def applied_action_name
        if has_untapped_state?
          "untap"
        else
          "tap"
        end
      end

      # @note Override
      def default_id
        name
      end

      def has_untapped_state?
        state == "untapped"
      end
    end
  end
end
