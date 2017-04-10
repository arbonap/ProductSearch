require 'rails_helper'

RSpec.describe ProductSearch, type: :model do
  let(:valid_search) { ProductSearch.new(query: 'iphone',
                                         results: 'iPhone 4') }
  let(:invalid_search) { ProductSearch.new(query: nil,
                                           results: nil) }

  it "is valid with valid attributes" do
    expect(valid_search).to be_valid
  end

  it "is not valid with all nil attributes" do
    expect(invalid_search).to_not be_valid
  end

  it { should validate_presence_of(:query) }

  it { should validate_presence_of(:results) }

  it { should validate_uniqueness_of(:query) }

  describe '#get_products' do
    context "responds to its methods" do
      it { expect(valid_search).to respond_to(:get_products) }
    end
  end
  describe '#create_results' do
    context "responds to its methods" do
      it { expect(valid_search).to respond_to(:create_results) }
    end
  end
end
