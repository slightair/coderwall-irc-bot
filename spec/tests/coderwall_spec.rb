# -*- coding:utf-8 -*-

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
include CoderWall

describe Coderwall do
  it { Coderwall.version.should eq '0.0.1' }
end
