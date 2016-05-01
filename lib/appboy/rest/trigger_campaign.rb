module Appboy
  module REST
    class TriggerCampaign < Base
      attr_reader :app_group_id, :campaign_id, :campaign_trigger, :external_user_ids

      def initialize(app_group_id, campaign_id:, external_user_ids: [], campaign_trigger: {})
        @app_group_id = app_group_id
        @campaign_id = campaign_id
        @external_user_ids = external_user_ids
        @campaign_trigger = campaign_trigger
      end

      def perform
        http.post '/campaigns/trigger/send', {
          app_group_id:        app_group_id,
          campaign_id:         campaign_id,
          trigger_properties:  campaign_trigger,
          recipients: {
            external_user_ids: external_user_ids
          }
        }
      end
    end
  end
end
