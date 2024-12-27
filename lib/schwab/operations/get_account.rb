require 'schwab/operations/base_operation'

module Schwab; module Operations
  class GetAccount < BaseOperation

    def call(account_id)
      url = [
        "https://api.schwabapi.com/v1/accounts/",
        account_id,
        "?fields=positions,orders"
      ].join

      response = perform_api_get_request(url: url)
      parse_api_response(response)
    end

  end
end; end
