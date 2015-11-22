module TechRadar
  class Radar
    attr_reader :data
    def initialize
      @data = YAML.load_file(Rails.root + "config" + "tech-radar.yml")
    end

    def quadrants
      @data.keys.map { |quadrant_name|
        quadrant(quadrant_name)
      }
    end

    def quadrant(quadrant_name)
      quadrant = @data.fetch(quadrant_name)
      by_ring = {}
      quadrant.each do |(ring,technologies)|
        by_ring[ring] ||= []
        (technologies || {}).each do |(name,data)|
          by_ring[ring] << mk_technology(name,ring,quadrant_name,data)
        end
      end
      TechRadar::Quadrant.new(
        name: quadrant_name, 
        rings: by_ring.map { |ring_name,technologies| 
          TechRadar::Ring.new(name: ring_name, technologies: technologies.sort_by { |tech| tech.name.downcase }) 
        }
      )
    end

    def rings
      quadrants.map(&:rings).flatten.group_by(&:name).map { |(ring_name,rings)|
        TechRadar::Ring.new(name: ring_name,technologies: rings.map(&:technologies).flatten.sort_by { |tech| tech.name.downcase })
      }
    end

    def ring(ring_name)
      rings.detect { |ring| ring.name == ring_name }
    end

    def technologies
      quadrants.map(&:rings).flatten.map(&:technologies).flatten.sort_by { |technology| technology.name.downcase }
    end

    def technology(name)
      technologies.detect { |technology| technology.name == name }
    end

  private

    def mk_technology(name,ring,quadrant,data)
      puts data.inspect if name == 'api_client'
      Technology.new(name: name,
                     ring: ring,
                     quadrant: quadrant,
                     more_details_url: data["more_details_url"],
                     why_url: data["why_url"],
                     purpose: data["purpose"],
                     why_summary: data["why_summary"])
    end

  end
end
