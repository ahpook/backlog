#!/usr/bin/env ruby

require 'sinatra'
require 'json'
require 'csv'
require 'open-uri'

get '/data' do
  content_type :json
  begin
    fh = open('https://docs.google.com/spreadsheet/pub?key=0Atq4T3BlL5qedFZNcENEMlZBa2M5UzZ5OXdaZzJWcXc&single=true&gid=0&output=csv')
  rescue => e
    halt "could not open url: #{e.message}"
  end

  gdoc = []
  CSV.new(fh).each do |line|
    gdoc << line
  end
  # gdoc now an array of arrays, with a structure like
  # [["Meta","Axes",titleC,titleD...],
  #  ["description1","Axis name 1",valueC1,valueD1...],
  #  ["description8","Axis name 8",valueC8,valueD8...],
  #  ["","Total",totalC,totalD...]]

  # we need to transpose this data structure, making a hash
  # keyed by the titles in row0[3..-1], whose values are an array
  # of the values of rows[1..-1][n], where `n` is the index of
  # that column in the row0 array.

  # but transpose blows up if any row is uneven, so pad with nil
  # http://stackoverflow.com/questions/250789/ruby-and-fastercsv-converting-uneven-rows-to-columns
  size = gdoc.max { |r1, r2| r1.size <=> r2.size }.size
  # Enlarge matrix inserting nils as needed
  gdoc.each { |r| r[size - 1] ||= nil }

  # now tranpose safely
  ticket_array = gdoc.transpose

  # and spit it out as json
  ticket_array.to_json
end
