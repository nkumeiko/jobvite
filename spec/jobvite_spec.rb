require 'jobvite'

describe Jobvite do

  def read_fixture(filename)
    File.read(File.join(File.dirname(__FILE__), 'fixtures', filename))
  end

  describe '#jobs' do
    before { jobvite.stub(:open) { read_fixture('jobs.xml') } }
    let(:jobvite) { Jobvite.new('asdf1234') }

    it 'has the correct number of jobs' do
      jobvite.jobs.size.should == 2
    end
    it 'parses attributes for each job' do
      jobvite.jobs.map(&:id).should == ['or1DVfwK', 'oxhzVfw2']
    end

    describe 'attributes 'do
      subject { jobvite.jobs.first }

      it { subject.id.should == 'or1DVfwK' }
      it { subject.title.should == 'Customer Support Representative' }
      it { subject.requisition_id.should == 'or1DVfwK' }
      it { subject.category.should == 'Customer Service' }
      it { subject.job_type.should == 'Full-Time Hourly' }
      it { subject.location.should == 'Sydney, Australia' }
      it { subject.date.should == Date.new(2012, 8, 4) }
      it { subject.detail_url.should == 'http://hire.jobvite.com/CompanyJobs/Job.aspx?c=qD09Vfwr&j=or1DVfwK' }
      it { subject.apply_url.should == 'http://hire.jobvite.com/CompanyJobs/Apply.aspx?c=qD09Vfwr&j=or1DVfwK' }
      it { subject.description.should == 'is a new and exciting online business that promotes fun things to do' }
      it { subject.brief_description.should == '<li><strong>Great city location</strong></li>' }
    end
  end

end
