require 'schwab/error'

module Schwab
  module Util
    module_function

    def response_success?(response)
      response.code.to_s =~ /^2\d\d/
    end

  end
end