$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH << File.join(File.dirname(__FILE__))

# External
require 'rubygems'
require 'rspec'
require 'pry'
require 'webmock/rspec'

# Library
require 'clearbit'
