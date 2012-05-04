require 'jobvite/version'
require 'jobvite/job'
require 'jobvite/client'

module Jobvite

  # Public: Helper method to return an instance of a Jobvite::Client
  def self.new(company_id)
    Client.new(company_id)
  end

end
