# -*- coding:utf-8 -*-

module Coderwall
  VERSION = '0.0.1'

  def self.version
    VERSION
  end
end

$: << File.dirname(File.expand_path(__FILE__))
require 'coderwall/api'
