def all_words_capitalized?(arr)
    arr.all? { |word| word == word[0].upcase + word[1..-1].downcase}
end 

def no_valid_url?(arr)
    dot = ["com", "net", "io", "org"]
    
    arr.none? do |url|
        parts = url.split(".")
        dot.include?(parts[1])
    end
end

def any_passing_students?(arrhashes)
    arrhashes.any? do |hash| 
        gr = hash[:grades]
        avg(gr) >= 75
    end
end

def avg(gr)
    sum = 0
    gr.each { |g| sum += g} 
    sum / gr.length
end