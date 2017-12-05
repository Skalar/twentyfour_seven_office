require "spec_helper"

describe TwentyfourSevenOffice::Services::Person do
  include Savon::SpecHelper

  before(:all) { savon.mock! }
  after(:all) { savon.unmock! }

  let(:get_persons_response) { xml_fixture :get_persons_response }
  let(:session_id) { TwentyfourSevenOffice::DataTypes::SessionId.new(session_id: "abcdefgh") }
  let(:changed_after) { DateTime.now }

  describe "#where" do
    it "returns all persons matching the search parameters" do
      savon.expects(:get_persons_detailed).with(message: {
        personSearch: {
          ChangedAfter: changed_after
        }
      }).returns(get_persons_response)

      person = TwentyfourSevenOffice::Services::Person.new(session_id)

      search_params = TwentyfourSevenOffice::DataTypes::PersonSearchParameters.new(changed_after: changed_after)
      persons = person.where(search_params)

      expect(persons.length).to eq(2)
    end
  end

  describe "#all" do
    it "uses a changed_after date far back in time to ensure all customers are returned" do
      changed_after = DateTime.new(1970, 1, 1)

      savon.expects(:get_persons_detailed).with(message: {
        personSearch: {
          ChangedAfter: changed_after,
          GetRelationData: true,
        }
      }).returns(get_persons_response)

      person = TwentyfourSevenOffice::Services::Person.new(session_id)
      persons = person.all

      expect(persons.length).to eq(2)
    end
  end
end
