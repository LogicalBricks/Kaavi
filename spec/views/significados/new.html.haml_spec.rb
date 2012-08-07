require 'spec_helper'

describe "significados/new" do
  before(:each) do
    assign(:significado, stub_model(Significado).as_new_record)
  end

  it "renders new significado form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => significados_path, :method => "post" do
    end
  end
end
