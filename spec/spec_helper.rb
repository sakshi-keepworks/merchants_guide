require 'simplecov'
SimpleCov.start do
  add_filter do |src|
    !(src.filename =~ /^#{SimpleCov.root}\/lib/)
  end
end if ENV['COVERAGE']

require_relative '../lib/roman_value'
