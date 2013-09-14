require 'spec_helper'

describe "movie_lists/edit" do
  before(:each) do
    @movie_list = assign(:movie_list, stub_model(MovieList,
      :title => "MyString"
    ))
  end

  it "renders the edit movie_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", movie_list_path(@movie_list), "post" do
      assert_select "input#movie_list_title[name=?]", "movie_list[title]"
    end
  end
end
