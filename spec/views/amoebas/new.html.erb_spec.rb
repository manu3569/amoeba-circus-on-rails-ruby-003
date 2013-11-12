require 'spec_helper'

describe "amoebas/new" do
  before(:each) do
    assign(:amoeba, stub_model(Amoeba,
      :name => "MyString",
      :generation => 1,
      :talent => nil
    ).as_new_record)
  end

  it "renders new amoeba form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", amoebas_path, "post" do
      assert_select "input#amoeba_name[name=?]", "amoeba[name]"
      assert_select "input#amoeba_generation[name=?]", "amoeba[generation]"
      assert_select "input#amoeba_talent[name=?]", "amoeba[talent]"
    end
  end
end
