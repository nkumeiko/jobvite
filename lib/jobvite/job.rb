module Jobvite
  class Job
    instance_methods.each { |m| undef_method m unless m =~ /^__/ || m =~ /inspect/ }

    def initialize(attributes)
      @attributes = attributes
    end

    def method_missing(meth, *args, &block)
      if @attributes.has_key?(meth)
        @attributes[meth]
      else
        super
      end
    end

  end
end
