require 'schwab/operations/base_operation'

module Schwab; module Operations
  class GetOrders < BaseOperation

    FIELDS = %i[quote fundamental]

    def call(account_id = nil)
      "https://api.schwabapi.com/v1/orders".tap do |url|
        url += ["?accountId=", account_id].join if account_id.present?
        return parse_api_response(perform_api_get_request(url: url))
      end
    end

  end
end; end
