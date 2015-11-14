module TechRadar
  # Handles a url that might be explicitly omitted due to not existing, vs omitted in order to force a google search
  class PossiblyMissingUrl
    attr_reader :url
    def initialize(name_this_is_a_url_for,possibly_a_url)
      @url = if possibly_a_url.to_s == "needed"
               nil
             elsif possibly_a_url.blank?
               "https://www.google.com/search?q=#{name_this_is_a_url_for}"
             else
               possibly_a_url.to_s
             end
    end

    def to_s; url; end
    alias :to_str :to_s
  end
end
