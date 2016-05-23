module Cronjob
  class Delete < Requests
    ENDPOINT = self.name.to_s.downcase.split('::').last
    METHOD   = :delete

    def initialize(args = {})
      @response = execute(METHOD, ENDPOINT, args)
    end

  end
end
