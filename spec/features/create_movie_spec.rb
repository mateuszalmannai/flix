describe 'Creating a new movie' do

  it "should save the movie and show the movie's details" do
    setup_new_movie

    # If you're taking advantage of the HTML 5 date field in Chrome,
    # you'll need to use 'fill_in' rather than 'select'
    # fill_in "Released on", with: (Time.now.year - 1).to_s
    click_button 'Create Movie'

    expect(current_path).to eq(movie_path(Movie.last))

    expect(page).to have_text('New Movie Title')
  end

  it "does not save the movie and goes to listing page when 'Cancel' is pressed" do
    setup_new_movie

    click_link "Cancel"

    expect(current_path).to eq(movies_path)

    expect(page).to_not have_text('New Movie Title')
  end

  it "does not save the movie if it's invalid" do
    visit new_movie_url

    expect {
      click_button 'Create Movie'
    }.not_to change(Movie, :count)

    expect(current_path).to eq(movies_path)
    expect(page).to have_text('error')
  end

  it "displays the footer partial" do
    setup_new_movie

    expect(page).to have_text("The Pragmatic Studio")
  end
end

private
def setup_new_movie
  visit movies_url

  click_link 'Add New Movie'

  expect(current_path).to eq(new_movie_path)

  fill_in "Title", with: "New Movie Title"
  fill_in "Description", with: "Superheroes saving the world from villains"
  select "PG-13", :from => "movie_rating"
  fill_in "Total gross", with: "75000000"
  select (Time.now.year - 1).to_s, :from => "movie_released_on_1i" # must be in past
  fill_in "Cast", with: "The award-winning cast"
  fill_in "Director", with: "The ever-creative director"
  fill_in "Duration", with: "123 min"
  fill_in "Image file name", with: "movie.png"
end

