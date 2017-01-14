require 'pry'
module VcrHelper
  def around
    VCR.use_cassette(cassette_name) do
      yield
    end
  end

private

  def cassette_name
    cassette_base_path + '/' + cassette_file_name
  end

  def cassette_base_path
    self.class.name.downcase
  end

  def cassette_file_name
    name.gsub(/^test_.\d+_/, ' ').strip.tr(' ', '_')
  end
end
