require "spec_helper"

describe TwentyfourSevenOffice::DataTypes::PersonItem do
  describe ".xml_attribute_names" do
    it "returns the attributes as an array of camelcased strings" do
      expect(described_class.xml_attribute_names).to include(
        'Id', 'FirstName', 'LastName', 'PostAddress', 'EmailAddresses', 'PhoneNumbers', 'RelationData'
      )
    end
  end
end
