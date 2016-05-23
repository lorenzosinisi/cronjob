module Cronjob
  class Client
    URL, API_VERSION = 'https://www.guardiano.pm/api/', 'v1/'
    DEFAULT_API_URL = URL + API_VERSION

    attr_accessor :conn

    def initialize
      @conn = Faraday.new(url: DEFAULT_API_URL)
    end

  end
end
