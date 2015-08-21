require "peoplehr/version"

require "addressable/uri"
require "faraday"
require "transproc"
require "virtus"

class PeopleHR::Error < StandardError; end

require "peoplehr/api"
require "peoplehr/employee"
require "peoplehr/employees"
