require 'spec_helper'

describe "movie_lists/new" do
  before(:each) do
    assign(:movie_list, stub_model(MovieList,
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new movie_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", movie_lists_path, "post" do
      assert_select "input#movie_list_title[name=?]", "movie_list[title]"
    end
  end
end
