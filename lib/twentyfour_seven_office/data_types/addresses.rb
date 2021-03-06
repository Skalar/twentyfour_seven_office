module TwentyfourSevenOffice
  module DataTypes
    # http://help.24sevenoffice.com/index.php?title=API:CompanyService_DataTypes#Addresses
    class Addresses < DataType
      attribute :post, Address
      attribute :delivery, Address
      attribute :visit, Address
      attribute :invoice, Address
    end
  end
end
