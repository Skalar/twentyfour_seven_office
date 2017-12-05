module TwentyfourSevenOffice
  module DataTypes
    class PersonRelationData < DataType
      attribute :contact_id, Integer
      attribute :customer_id, Integer
      attribute :email, String
      attribute :mobile, String
      attribute :phone, String
      attribute :title, String
    end
  end
end
