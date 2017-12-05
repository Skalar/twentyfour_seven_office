module TwentyfourSevenOffice
  module DataTypes
    # http://developer.24sevenoffice.com/hidden/webservicepersonservice-datatypes/
    class PersonItem < DataType
      attribute :id, Integer
      attribute :first_name, String
      attribute :last_name, String
      attribute :post_address, Address
      attribute :email_addresses, Array[PersonEmailAddress]
      attribute :phone_numbers, Array[PersonPhoneNumber]
      attribute :relation_data, Array[PersonRelationData]
    end
  end
end
