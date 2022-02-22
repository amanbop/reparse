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

 #parsed_text2 = parsed_text = parser.parse
parsed_text = {"CSS"=>2, "Rails"=>2, "Ruby on Rails"=>2, "Ruby"=>2, "E"=>2, "Sass"=>1, "Text Executive Programming Language"=>1, "programming language"=>1, "CI/CD"=>1, "HTML"=>1, "recoil"=>1, "MST"=>1, "Mobx"=>1, "state management libraries"=>1, "XBL"=>1, "X10"=>1, "TypeScript"=>1, "SiMPLE"=>1, "Pipelines"=>1, "JavaScript"=>1, "ECMAScript"=>1, "Clean"=>1, "BASIC"=>1}
#parsed_text2= {"Rails"=>2, "Ruby on Rails"=>2, "Ruby"=>2, "E"=>2, "Sass"=>1, "Text Executive Programming Language"=>1, "programming language"=>1, "CI/CD"=>1, "HTML"=>1, "recoil"=>1, "MST"=>1, "Mobx"=>1, "state management libraries"=>1, "XBL"=>1, "X10"=>1, "TypeScript"=>1, "SiMPLE"=>1, "Pipelines"=>1, "JavaScript"=>1, "ECMAScript"=>1, "Clean"=>1, "BASIC"=>1}
parsed_text2= {"Ruby"=>2, "E"=>2, "Sass"=>1, "Text Executive Programming Language"=>1, "programming language"=>1, "CI/CD"=>1, "HTML"=>1, "recoil"=>1, "MST"=>1, "Mobx"=>1, "state management libraries"=>1, "XBL"=>1, "X10"=>1, "TypeScript"=>1, "SiMPLE"=>1, "Pipelines"=>1, "JavaScript"=>1}

 puts parsed_text
 puts '++++++++++++'
 puts parsed_text2

 parser.compare_hashes(parsed_text,parsed_text2)
