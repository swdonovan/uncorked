class SnoothWine
  attr_reader :image,
              :name,
              :varietal,
              :vintage,
              :vineyard,
              :rating,
              :price
  def initialize(attrs)
    @image = attrs[:image]
    @name = attrs[:name]
    @varietal = attrs[:varietal]
    @vintage = attrs[:vintage]
    @vineyard = attrs[:winery]
    @rating = attrs[:snoothrank]
    @price = attrs[:price]
  end

  def self.return_all
    raw_data = SnoothService.return_all
    raw_data.map do |raw_data|
      SnoothWine.new(raw_data)
    end
  end
end
