require 'spec_helper'

describe Appboy::REST::SendMessages do
  let(:http) { double(:http) }

  let(:payload) {{
    campaign_id: :campaign_id,
    external_user_ids: :external_user_ids,
    segment_id: :segment_id,
    campaign_trigger: :campaign_trigger
  }}

  let(:app_group_id) { :app_group_id }

  subject { described_class.new(app_group_id,
    campaign_id: :campaign_id,
    external_user_ids: [:external_user_ids],
    campaign_trigger: :campaign_trigger
  ) }

  before { subject.http = http }

  it 'makes an http call to the send messages endpoint' do
    expect_send_messages_http_call

    subject.perform
  end

  def expect_send_messages_http_call
    expect(http).to receive(:post).with '/campaigns/trigger/send', {
      app_group_id: :app_group_id,
      campaign_id: :campaign_id,
      external_user_ids: [:external_user_ids],
      campaign_trigger: :campaign_trigger
    }
  end
end
