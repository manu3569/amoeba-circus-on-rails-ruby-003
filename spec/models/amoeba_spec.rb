require 'spec_helper'

describe Amoeba do
  describe "#split" do
    let(:joe) { FactoryGirl.create :joe }
    let(:new_amoeba_1) { "Frank" }
    let(:new_amoeba_2) { "Mark" }
    context "when amoeba Joe of generation 1 exists" do
      before { joe.split(new_amoeba_1, new_amoeba_2) }
      it "creates two new amoebas of generation 2 with two new names" do
        expect(Amoeba.find_by(name: new_amoeba_1).generation).to eq(2)
        expect(Amoeba.find_by(name: new_amoeba_2).generation).to eq(2)
      end
      it "creates the new amoebas with the same talent as the parent" do
        expect(Amoeba.find_by(name: new_amoeba_1).talent.name).to eq(joe.talent.name)
        expect(Amoeba.find_by(name: new_amoeba_2).talent.name).to eq(joe.talent.name)
      end
      it "destroys Joe" do
        expect(Amoeba.find_by(name: joe.name)).to be_nil
      end
    end
  end
end
