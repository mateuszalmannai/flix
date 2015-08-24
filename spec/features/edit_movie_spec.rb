describe "Editing a movie" do

  it "updates the movie and shows the movie's updated details" do
    movie = setup_movie_to_edit

    expect(current_path).to eq(edit_movie_path(movie))

    expect(find_field('Title').value).to eq(movie.title)

    fill_in 'Title', with: "Updated Movie Title"

    click_button 'Update Movie'

    expect(current_path).to eq(movie_path(movie))

    expect(page).to have_text('Updated Movie Title')
    expect(page).to have_text('Movie successfully updated!')
  end

  it "does not update the movie and goes to the listing page when 'Cancel' is pressed" do
    movie = setup_movie_to_edit

    expect(current_path).to eq(edit_movie_path(movie))

    expect(find_field('movie_title').value).to eq(movie.title)

    fill_in "Title", with: "Updated Movie Title"

    click_link "Cancel"

    expect(current_path).to eq(movies_path)

    expect(page).to_not have_text('Updated Event Name')
  end

  it "does not update the movie if it's invalid" do
    movie = Movie.create(movie_attributes)

    visit edit_movie_url(movie)

    fill_in 'Title', with: " "

    click_button 'Update Movie'

    expect(page).to have_text('error')
  end

  it "displays the footer partial" do
    movie=setup_movie_to_edit

    expect(current_path).to eq(edit_movie_path(movie))

    expect(find_field('movie_title').value).to eq(movie.title)

    expect(page).to have_text("The Pragmatic Studio")
  end
end

private

def setup_movie_to_edit
  movie = Movie.create(movie_attributes)

  visit movie_url(movie)

  click_link 'Edit'
  movie
end


