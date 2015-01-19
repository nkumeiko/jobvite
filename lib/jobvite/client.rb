require 'open-uri'
require 'date'
require 'nokogiri'

module Jobvite

  class Client

    DEFAULT_BASE_URL = 'http://www.jobvite.com/CompanyJobs/Xml.aspx?c='

    def initialize(company_id, base_url = DEFAULT_BASE_URL)
      @company_id = company_id
      @url = base_url + @company_id
    end

    # Public: Returns a collection of jobs for the company specified
    def jobs
      doc = Nokogiri::XML open(@url)

      doc.search('//job').map { |node|
        Job.new(attributes_from(node))
      }
    end

    def attributes_from(node)
      {
        :id => extract_text(node, 'id'),
        :title => extract_text(node, 'title'),
        :requisition_id => extract_text(node, 'requisitionid'),
        :category => extract_text(node, 'category'),
        :location => extract_text(node, 'location'),
        :job_type => extract_text(node, 'jobtype'),
        :date => extract_date(node, 'date'),
        :detail_url => extract_text(node, 'detail-url'),
        :apply_url => extract_text(node, 'apply-url'),
        :description => extract_text(node, 'description'),
        :brief_description => extract_text(node, 'briefdescription'),
      }
    end

    def extract_text(node, name)
      node.at(name).text
    end

    def extract_date(node, name)
      Date.strptime(extract_text(node, name), "%m/%d/%Y")
    end
  end

end
