require 'nokogiri'
require 'open-uri'
require 'cgi'
require 'ciyuan/character'

module Ciyuan
  
  BASE_URL = "http://www.internationalscientific.org/"
  ETHY_PATH = "CharacterEtymology.aspx?characterInput="
  
  class << self
    def search(character)
      html = open("#{BASE_URL}#{ETHY_PATH}#{CGI::escape(character)}")
      doc = Nokogiri::HTML(html.read)
      doc.encoding = 'utf-8'
      Character.new(doc)
    end
  end
end