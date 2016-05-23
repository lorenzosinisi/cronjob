module Cronjob
  class Create < Requests
    ENDPOINT = 'new' # I could name that class New but we will have New.new wich is weird
    METHOD   = :post

    def initialize(args = {})
      @response = execute(METHOD, ENDPOINT, args)
    end

  end
end
