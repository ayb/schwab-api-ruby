require 'schwab/authentication'
require 'schwab/client'
require 'schwab/error'
require 'schwab/version'
require 'schwab/operations/get_account'
require 'schwab/operations/get_accounts'
require 'schwab/operations/get_instrument'
require 'schwab/operations/get_option_chain'
require 'schwab/operations/get_orders'
require 'schwab/operations/get_price_history'
require 'schwab/operations/get_quotes'
require 'schwab/operations/get_transactions'

module Schwab
  class Client
    include Schwab::Authentication
    include Schwab::Error

    def initialize(args)
      @access_token = args[:access_token]
      @refresh_token = args[:refresh_token]
      @access_token_expires_at = args[:access_token_expires_at]
      @refresh_token_expires_at = args[:refresh_token_expires_at]
      @client_id = args[:client_id] || raise_error('client_id is required!')
      @secret = args[:secret] || raise_error('client_id is required!')
      @redirect_uri = args[:redirect_uri] || raise_error('redirect_uri is required!')
    end

    def get_instrument(symbol, projection)
      Operations::GetInstrument.new(self).call(symbol, projection:)
    end

    def get_price_history(symbol, **options)
      Operations::GetPriceHistory.new(self).call(symbol, **options)
    end

    def get_quotes(symbols, **options)
      Operations::GetQuotes.new(self).call(symbols:, **options)
    end

    def get_accounts
      Operations::GetAccounts.new(self).call
    end

    def get_account(account_id)
      Operations::GetAccount.new(self).call(account_id)
    end

    def get_option_chain(symbol, **options)
      Operations::GetOptionChain.new(self).call(symbol, options)
    end

    def get_orders(account_id = nil)
      Operations::GetOrders.new(self).call(account_id)
    end

    def get_transactions(account_id)
      Operations::GetTransactions.new(self).call(account_id)
    end
  end
end