require "cronjob/version"
require "cronjob/configuration"
# HTTP Client
require 'json'
require 'faraday'
require "cronjob/client"
require "cronjob/requests/requests"
# GET /ping
require "cronjob/requests/ping"
# POST /new
require "cronjob/requests/create"
# GET /list
require "cronjob/requests/list"
# DELETE /delete
require "cronjob/requests/delete"
# GET /show
require "cronjob/requests/show"
# PATCH /edit
require "cronjob/requests/edit"

module Cronjob
  def self.configuration
    # ugly but lets follow the convention
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
