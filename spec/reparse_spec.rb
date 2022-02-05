# frozen_string_literal: true

RSpec.describe Reparse do
  parser = Reparse::Reparse.new

  it "has a version number" do
    expect(Reparse::VERSION).not_to be nil
  end

  it "parses the text" do
    parser.input_text = 'Having good understanding of HTML, Jave, JavaScript, Writing HTML, CSS, and JavaScript (and Ideally Typescript). Being up on latest practices is a must, e.g., HTML5, CSS3, and ECMAScript 6 (minimum)'
    parsed_text = parser.parse
    puts parsed_text

    #expect(false).to eq(false)
  end
end
