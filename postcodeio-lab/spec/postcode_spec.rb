require 'spec_helper'

describe Postcodesio do

  context 'requesting information on a single postcode works correctly' do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_single_postcode('W93UL') #input a postcode
    end

    it "should respond with a status message of 200" do
      expect(@postcodesio.single_status_response).to eq 200
    end

    it "should have a results hash" do
      expect(@postcodesio.single_response).to include("result")
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@postcodesio.single_postcode_length).to be_between(5, 7)
    end

    it "should return an quality key integer between 1-9" do
      expect(@postcodesio.single_quality_key).to be_between(1, 9)
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@postcodesio.single_easting_val).to be_kind_of(Integer)
    end

    it "should return an ordnance survey northings value as integer" do
      expect(@postcodesio.single_northing_val).to be_kind_of(Integer)
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(["England", "Wales", "Scotland", "Northern Ireland"]).to include @postcodesio.single_country 
    end

    it "should return a string value for NHS authority " do
      expect(@postcodesio.single_nhs_a).to be_kind_of(String)
    end

    it "should return a longitude float value" do
      expect(@postcodesio.single_longitude).to be_kind_of(Float)
    end

    it "should return a latitude float value" do
      expect(@postcodesio.single_latitude).to be_kind_of(Float)
    end

    it "should return a parliamentary constituency string" do
      expect(@postcodesio.single_parliamentary_constituency).to be_kind_of(String)
    end

    it "should return a european_electoral_region string" do
      expect(@postcodesio.single_european_region).to be_kind_of(String)
    end

    it "should return a primary_care_trust string" do
      expect(@postcodesio.single_primary_care_trust).to be_kind_of(String)
    end

    it "should return a region string" do
      expect(@postcodesio.single_region).to be_kind_of(String)
    end

    it "should return a parish string" do
      expect(@postcodesio.single_parish).to be_kind_of(String)
    end

    it "should return a lsoa string" do
      expect(@postcodesio.single_lsoa).to be_kind_of(String)
    end

    it "should return a msoa string" do
      expect(@postcodesio.single_msoa).to be_kind_of(String)
    end

  #   # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect(@postcodesio.single_admin_district).to be_kind_of(String)
    end

    it "should return a incode string of three characters" do
      expect(@postcodesio.single_incode_type).to eq String
      expect(@postcodesio.single_incode_length).to eq 3
    end

    it "should return a msoa string" do
      expect(@postcodesio.single_msoa).to be_kind_of(String)
    end

    it "should return a incode string of 3-4 characters" do
      expect(@postcodesio.single_incode_type).to eq String
      expect(@postcodesio.single_incode_length).to be_between(3,4)
    end
  end

  context "multiple postcodes validation" do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_multiple_postcodes(@postcodesio.postcode_array) #Add in array of postcodes
      # p @response
    end

    it "should respond with a status message of 200" do
      expect(@postcodesio.multiple_status_response).to eq 200
    end

    it "should return the first query as the first postcode in the response" do
      expect(@postcodesio.first_query_postcode).to be == @postcodesio.postcode_array[0]
    end

    it "should return the second query as the first postcode in the response" do
      expect(@postcodesio.second_query_postcode).to be == @postcodesio.postcode_array[1]
    end

    it "should have a results hash" do
      expect(@postcodesio.multiple_response).to include("result")
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@postcodesio.multiple_postcode_length).to all(be_between(5,7).inclusive)
    end

    it "should return an quality key integer between 1-9" do
      expect(@postcodesio.multiple_quality).to all(be_between(1,9))
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@postcodesio.multiple_eastings).to all(be_kind_of(Integer))
    end

    it "should return an ordnance survey northings value as integer" do
      expect(@postcodesio.multiple_northings).to all(be_kind_of(Integer))
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@postcodesio.multiple_country).to include("England").or include("Wales").or include("Northern Ireland").or include("Scotland")
    end

    it "should return a string value for NHS authority " do
      expect(@postcodesio.multiple_nhs_authority).to all(be_kind_of(String))
    end

    it "should return a longitude float value" do
      expect(@postcodesio.multiple_longitude).to all(be_kind_of(Float))
    end

    it "should return a latitude float value" do
      expect(@postcodesio.multiple_latitude).to all(be_kind_of(Float))
    end

    it "should return a parliamentary constituency string" do
      expect(@postcodesio.multiple_parliamentary_constituency).to all(be_kind_of(String))      
    end

    it "should return a european_electoral_region string" do
      expect(@postcodesio.multiple_european_electoral_region).to all(be_kind_of(String))      
    end

    it "should return a primary_care_trust string" do
      expect(@postcodesio.multiple_primary_care_trust).to all(be_kind_of(String))    
    end

    it "should return a region string" do
      expect(@postcodesio.multiple_region).to all(be_kind_of(String))     
    end

    it "should return a parish string" do
      expect(@postcodesio.multiple_parish).to all(be_kind_of(String))      
    end

    it "should return a lsoa string" do
      expect(@postcodesio.multiple_lsoa).to all(be_kind_of(String))
    end

    it "should return a msoa string" do
      expect(@postcodesio.multiple_msoa).to all(be_kind_of(String))
    end
  #   # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect(@postcodesio.multiple_admin_district).to all(be_kind_of(String))
    end

    it "should return a incode string of three characters" do
      expect(@postcodesio.multiple_incode_type).to all(be String)
      expect(@postcodesio.multiple_incode_length).to all(be == 3)
    end

    it "should return a incode string of 3-4 characters" do
      expect(@postcodesio.multiple_incode_type).to all(be String)
      expect(@postcodesio.multiple_incode_length).to all(be_between(3,4))
    end

  end


end
