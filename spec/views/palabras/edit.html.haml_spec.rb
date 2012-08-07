require 'spec_helper'

describe "palabras/edit" do
  before(:each) do
    @palabra = assign(:palabra, stub_model(Palabra))
  end

  it "renders the edit palabra form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => palabras_path(@palabra), :method => "post" do
    end
  end
end
