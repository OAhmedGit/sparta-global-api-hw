require 'httparty'
require 'json'

class Postcodesio
  include HTTParty

  attr_accessor :single_status, :single_response, :multiple_status, :multiple_response, :postcode_array, :temp_array

  base_uri 'https://api.postcodes.io'

  def initialize
    @postcode_array = ["W93UL", "W25EN", "SE181HP"]
    @temp_array = Array.new
  end

  def get_single_postcode(postcode)
    @single_response = JSON.parse(self.class.get("/postcodes/#{postcode}").body)
  end

  def get_multiple_postcodes(postcodes_array)
    @multiple_response = JSON.parse(self.class.post('/postcodes', body: { "postcodes" => postcodes_array}).body)
  end

  def single_status_response
    @single_status = @single_response["status"]
  end

  def multiple_status_response
    @multiple_status = @multiple_response["status"]
  end

  def single_postcode_length
    @single_response["result"]["postcode"].gsub(' ', '').length
  end

  def single_quality_key
    @single_response["result"]["quality"]
  end

  def single_easting_val
    @single_response["result"]["eastings"]
  end

  def single_northing_val
    @single_response["result"]["northings"]
  end

  def single_country
    @single_response["result"]["country"]
  end

  def single_nhs_a
    @single_response["result"]["nhs_ha"]
  end

  def single_longitude
    @single_response["result"]["longitude"]
  end

  def single_latitude
    @single_response["result"]["latitude"]
  end

  def single_parliamentary_constituency
    @single_response["result"]["parliamentary_constituency"]
  end

  def single_european_region
    @single_response["result"]["european_electoral_region"]
  end

  def single_primary_care_trust
    @single_response["result"]["primary_care_trust"]
  end

  def single_region
    @single_response["result"]["region"]
  end
  
  def single_parish
    @single_response["result"]["parish"]
  end

  def single_lsoa
    @single_response["result"]["lsoa"]
  end

  def single_msoa
    @single_response["result"]["msoa"]
  end

  def single_admin_district
    @single_response["result"]["admin_district"]
  end

  def single_incode_type
    @single_response["result"]["incode"].class
  end

  def single_incode_length
    @single_response["result"]["incode"].length
  end

  def first_query_postcode
    @multiple_response["result"][0]["query"]
  end

  def second_query_postcode
    @multiple_response["result"][1]["query"]
  end

  def multiple_postcode_length
    @multiple_response["result"].each do |r|
      @temp_array << r["result"]["postcode"].gsub(' ','').length
    end

    @temp_array
  end

  def multiple_quality
    @temp_array.clear
    @multiple_response["result"].each do |r|
      @temp_array << r["result"]["quality"]
    end

    @temp_array
  end

  def multiple_eastings
    @temp_array.clear
    @multiple_response["result"].each do |r|
      @temp_array <<  r["result"]["eastings"]
    end

    @temp_array
  end

  def multiple_northings
    @temp_array.clear
    @multiple_response["result"].each do |r|
      @temp_array << r["result"]["northings"]
    end

    @temp_array
  end

  def multiple_country
    @temp_array.clear
    @multiple_response["result"].each do |r|
      @temp_array << r["result"]["country"]
    end

    @temp_array
  end

  def multiple_nhs_authority
    @temp_array.clear
    @multiple_response["result"].each do |r|
      @temp_array << r["result"]["nhs_ha"]
    end

    @temp_array
  end

  def multiple_longitude
    @temp_array.clear
    @multiple_response["result"].each do |r|
      @temp_array << r["result"]["longitude"]
    end

    @temp_array
  end

  def multiple_latitude
    @temp_array.clear
    @multiple_response["result"].each do |r|
      @temp_array << r["result"]["latitude"]
    end

    @temp_array
  end

  def multiple_parliamentary_constituency
    @temp_array.clear
    @multiple_response["result"].each do |r|
      @temp_array << r["result"]["parliamentary_constituency"]
    end

    @temp_array
  end

  def multiple_european_electoral_region
    @temp_array.clear
    @multiple_response["result"].each do |r|
      @temp_array << r["result"]["european_electoral_region"]
    end

    @temp_array
  end

  def multiple_primary_care_trust
    @temp_array.clear
    @multiple_response["result"].each do |r|
      @temp_array << r["result"]["primary_care_trust"]
    end

    @temp_array
  end

  def multiple_region
    @temp_array.clear
    @multiple_response["result"].each do |r|
      @temp_array << r["result"]["region"]
    end

    @temp_array
  end

  def multiple_parish
    @temp_array.clear
    @multiple_response["result"].each do |r|
      @temp_array << r["result"]["parish"]
    end

    @temp_array
  end

  def multiple_lsoa
    @temp_array.clear
    @multiple_response["result"].each do |r|
      @temp_array << r["result"]["lsoa"]
    end

    @temp_array
  end

  def multiple_msoa
    @temp_array.clear
    @multiple_response["result"].each do |r|
      @temp_array << r["result"]["msoa"]
    end

    @temp_array
  end

  def multiple_admin_district
    @temp_array.clear
    @multiple_response["result"].each do |r|
      @temp_array << r["result"]["admin_district"]
    end

    @temp_array
  end

  def multiple_incode_type
    @temp_array.clear
    @multiple_response["result"].each do |r|
      @temp_array << r["result"]["incode"].class
    end

    @temp_array
  end

  def multiple_incode_length
    @temp_array.clear
    @multiple_response["result"].each do |r|
      @temp_array << r["result"]["incode"].length
    end

    @temp_array
  end

end

