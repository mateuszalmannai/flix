# Calling this method without any parameters simply returns the hash of attribute names and values.
# The default hash parameters allows any of the attribute values to be overridden
# When you call movie_attributes with a hash of attributes, that hash will get merged with the
# existing attributes hash, i.e. to change the total_gross attribute value:
# movie_attributes(total_gross: 6000000.00)
#
def movie_attributes(overrides = {})
  {
    title: "Iron Man",
    rating: "PG-13",
    total_gross: 318412101.00,
    description: "Tony Stark builds an armored suit to fight the throes of evil",
    released_on: "2008-05-02",
    cast: "Robert Downey Jr., Gwyneth Paltrow and Terrence Howard",
    director: "Jon Favreau",
    duration: "126 min",
    image_file_name: "ironman.jpg"
  }.merge(overrides)
end
