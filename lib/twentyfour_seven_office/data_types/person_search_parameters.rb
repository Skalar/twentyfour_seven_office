module TwentyfourSevenOffice
  module DataTypes
    class PersonSearchParameters < DataType
      attribute :changed_after, DateTime
      attribute :get_relation_data, Boolean
    end
  end
end
