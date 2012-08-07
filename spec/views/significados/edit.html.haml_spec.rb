require 'spec_helper'

describe "significados/edit" do
  before(:each) do
    @significado = assign(:significado, stub_model(Significado))
  end

  it "renders the edit significado form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => significados_path(@significado), :method => "post" do
    end
  end
end
