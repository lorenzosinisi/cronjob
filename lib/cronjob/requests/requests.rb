module Cronjob
  class Requests
    attr_accessor :response

    def client
      Client.new.conn
    end

    def parse(data)
      JSON.parse(data)
      rescue JSON::ParserError => e
        data
    end

    def execute(method, endpoint, args)
      args[:auth_token] = Cronjob.configuration.token
      data = client.send(method, endpoint, args)
      parse(data.body)
    end

  end
end
