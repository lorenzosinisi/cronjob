module Cronjob
  class Edit < Requests
    ENDPOINT = self.name.to_s.downcase.split('::').last
    METHOD   = :patch

    def initialize(args = {})
      @response = execute(METHOD, ENDPOINT, args)
    end

  end
end
