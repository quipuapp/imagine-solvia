module ProfessionalsHelper
  def short_distance_for(seconds)
    distance_of_time_in_words(seconds).
      gsub(/about/, '').
      gsub(/hours?/, 'h').
      gsub(/minutes?/, 'm')
  end
end
