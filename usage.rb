require './lib/reparse.rb'
parser = Reparse::Reparse.new
# parser.input_text = 'Our customer is an important'

parser.input_text ='Agtech startup looking for developers to join their journey to change farming.

Requirements:

Good English skills (spoken and written)

Good experience with Ruby On Rails for backend use.

React and state management libraries like Mobx, MST or recoil.

Writing HTML, CSS, and JavaScript (and Ideally Typescript). Being up on latest practices is a must, e.g., HTML5, CSS3, and ECMAScript 6 (minimum)

Database design and management, including being up on the latest practices. Especially the use of PostgresSQL.

Server management and deployment for the relevant environment and basic Linux skills.

Familiarity with CSS preprocessors, frameworks, bundlers, and associated languages/syntaxes/libraries (e.g., Sass, Tailwindcss..)

Experience implementing testing platforms and unit tests

Proficiency with Git and the Github Flow.

Understanding of the concept of CI/CD pipelines.

Appreciation for clean, simple and well documented code. Understanding of the KISS concept.

You know what a Kanban is and how to use it. X10, XBL Ruby on Rails Text Executive Programming Language';


# parser.word_scrub_list = ['use']
# parser.punctuation_scrub_list = ['|']

# parser.load_search_terms

 parsed_text = parser.parse
 puts parsed_text

 parser.compare_hashes(parsed_text,parsed_text)
