# frozen_string_literal: true

RSpec.describe Reparse do
  parser = Reparse::Reparse.new
  parser.input_text = 'Having good understanding of HTML, Jave, JavaScript, Writing HTML, CSS, and JavaScript (and Ideally Typescript). Being up on latest practices is a must, e.g., HTML5, CSS3, and ECMAScript 6 (minimum)'
  parsed_text = parser.parse


  it "1. It has a version number" do
    expect(Reparse::VERSION).not_to be nil
  end

  it "2. It parses the text to hash of word count" do
    expect(parsed_text.class).to eq(Hash)
  end

  it "3. It counts the terms correctly" do
    expect(parsed_text["HTML"]).to eq(2)
    expect(parsed_text["JavaScript"]).to eq(2)
  end
end
