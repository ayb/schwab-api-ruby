require 'schwab/operations/base_operation'

module Schwab; module Operations
  class GetAccounts < BaseOperation

    def call
      response = perform_api_get_request(url: "https://api.schwabapi.com/v1/accounts")
      parse_api_response(response)
    end

  end
end; end