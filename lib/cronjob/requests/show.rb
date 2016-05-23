module Cronjob
  class Show < Requests
    ENDPOINT = self.name.to_s.downcase.split('::').last
    METHOD   = :get

    def initialize(args = {})
      @response = execute(METHOD, ENDPOINT, args)
    end

  end
end
