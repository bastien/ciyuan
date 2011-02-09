module Ciyuan
  class Character
    attr_accessor :etymology, :phonetic, :simplification, :english_explanation,
                  :seal_images, :lst_images, :bronze_images, :oracle_images

    def initialize(doc, get_images=false)
      @etymology = doc.search("#charEty").first.content
      @phonetic = doc.search("#charPhon").first.content
      @simplification = doc.search("#SimplificationMech").first.content
      @english_explanation = doc.search("#EnglishExplanation").first.content
      @unicode = doc.search("#SimplifiedUCS2Hex").first.content
      if get_images
        @seal_images = doc.search("#SealImages img").map{|element| File.join(BASE_URL,element.attribute("src"))}
        @lst_images = doc.search("#LstImages img").map{|element| File.join(BASE_URL,element.attribute("src"))}
        @bronze_images = doc.search("#BronzeImages img").map{|element| File.join(BASE_URL,element.attribute("src"))}
        @oracle_images = doc.search("#OracleImages img").map{|element| File.join(BASE_URL,element.attribute("src"))}
      end
    end
  end
end