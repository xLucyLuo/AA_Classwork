def all_words_capitalized?(words)
    words.all?{|word| word == word.capitalize}
end

def no_valid_url?(urls)
    url_suffix = [".com", ".net", ".io", ".org"]
    urls.none?{|url| url_suffix.any?{|suf| url.end_with?(suf)}}
end

def any_passing_students?(students)
    students.any?{|student| pass?(student[:grades])}
end

def pass?(grades)
    grades.sum/grades.length.to_f >= 75.0
end