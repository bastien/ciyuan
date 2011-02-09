require 'nokogiri'
require 'open-uri'
require 'cgi'
require 'ciyuan/character'

module Ciyuan
  
  BASE_URL = "http://www.internationalscientific.org/"
  ETHY_PATH = "CharacterEtymology.aspx?characterInput="
  
  class << self
    def search(character)
      doc = Nokogiri::HTML(open("#{BASE_URL}#{ETHY_PATH}#{CGI::escape(character)}"))
      Character.new(doc)
    end
  end
end