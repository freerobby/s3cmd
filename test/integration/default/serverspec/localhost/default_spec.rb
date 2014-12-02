require 'spec_helper'

describe file('/root/.s3cfg') do
  it { should be_file }
end

describe file('/home/vagrant/.s3cfg') do
  it { should be_file }
end
