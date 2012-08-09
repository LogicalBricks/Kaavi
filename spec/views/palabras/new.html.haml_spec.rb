require 'spec_helper'

describe "palabras/new" do
  before(:each) do
    assign(:palabra, stub_model(Palabra).as_new_record)
  end

  it "renders new palabra form" do
    #render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    #assert_select "form", :action => palabras_path, :method => "post" do
#    end
  end
end
