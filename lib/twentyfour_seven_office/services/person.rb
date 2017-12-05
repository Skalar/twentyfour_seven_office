module TwentyfourSevenOffice
  module Services
    class Person < Service
      wsdl "https://webservices.24sevenoffice.com/CRM/Contact/PersonService.asmx?WSDL"

      api_operation :get_persons_detailed,
                    input_data_types: { person_search: PersonSearchParameters }

      def where(query = {})
        search_params = TwentyfourSevenOffice::DataTypes::PersonSearchParameters.new(query)
        persons = get_persons_detailed(person_search: search_params)
        as_array(persons)
      end

      def all
        search_params = TwentyfourSevenOffice::DataTypes::PersonSearchParameters.new(
          changed_after: DateTime.new(1970, 1, 1),
          get_relation_data: true,
        )
        persons = get_persons_detailed(person_search: search_params)
        as_array(persons)
      end

      private

      def return_props
        ::TwentyfourSevenOffice::DataTypes::PersonItem.xml_attribute_names
      end
    end
  end
end
