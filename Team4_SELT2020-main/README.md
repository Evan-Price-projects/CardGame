#### README

## SELT Final Project - Online Card Deck Application

This is a Rails Application deployed to Heroku, the most recent Heroku link is listed here:\
`https://team4-selt2020-3.herokuapp.com`

Iteration 1 Link: `https://team4-selt2020.herokuapp.com/`\
Iteration 2 Link: `https://team4-selt2020-2.herokuapp.com/`\
Iteration 3 Link: `https://team4-selt2020-3.herokuapp.com/`

Pivotal Tracker:  `https://www.pivotaltracker.com/n/projects/2474438` 

Access Heroku website [here](https://team4-selt2020-3.herokuapp.com/).

Access PivotalTracker [here](https://www.pivotaltracker.com/n/projects/2474438).

Access Wiki page [here](https://github.com/UIOWAjohnsonhj/Team4_SELT2020/wiki).

Access Google Slides Presentation [here](https://docs.google.com/presentation/d/114B0pM1KbIk2cb2TxjKetFoW5YXVPDaq9EgHM2aFPkQ/edit?usp=sharing).

### About Application

Aces is an online card deck application that connects family and friends through their love of playing cards. It is an application that is free of any rules and fully dependent on the user. This application having no rules allows a user to make the rules, we simply just provide them with a smart deck and interface on which to play their favourite card games. This is a free application that is to help people through boredom they might experience while far away from each in this COVID19 world.

### Implementation

This application is created with a Ruby on Rails framework. It is an Agile project that had some changes to it during every sprint. The project was implemented rather fluidly with changes being welcomed at each iteration. This was made using Test driven development with RSpec and Cucumber tests both being written for this project to work as intended. The full details of this implemenation can be seen on our very in-depth wiki page [here](https://github.com/UIOWAjohnsonhj/Team4_SELT2020/wiki).

### Initial Setup

To get this application running on your personal computer:

          1. Clone this repo with at https://github.com/UIOWAjohnsonhj/Team4_SELT2020.git (Can also use SSH)
          2. Install/Use Ruby v2.6.6, Rails v4.2.11.3 and bundler 2.11
          3. Run bundle install
          4. Run bundle exec rake db:migrate
          5. Run bundle exec rake db:schema:load
          6. Run bundle exec rake db:seed
          7. If you cannot run the application in developement format, feel free to reach out

### Useful resources used in creating this project:
**RSPEC:** How to assign instance vairables in controller spec ----------------------- [stackoverflow.com/...](https://stackoverflow.com/questions/16005281/rspec-how-to-assign-instance-variable-in-controller-spec/16005967)\
**RUBY:** Check for numbers within string -------------------------------------------- [stackoverflow.com/...](https://stackoverflow.com/questions/2224790/how-do-i-check-if-a-string-has-at-least-one-number-in-it-using-ruby)\
**VIEWS:** Select_tag ---------------------------------------------------------------- [apidock.com/...](https://apidock.com/rails/ActionView/Helpers/FormTagHelper/select_tag)\
**HTML/VIEWS:** Split page into parts ------------------------------------------------ [stackoverflow.com/...](https://stackoverflow.com/questions/12284044/how-to-split-page-into-4-equal-parts)\
**RAILS:** Unicode in button --------------------------------------------------------- [stackoverflow.com/...](https://stackoverflow.com/questions/11515554/how-do-i-use-unicode-in-a-button-rails-form-for)\
**CSS:** Alignment ------------------------------------------------------------------- [stackoverflow.com/...](https://stackoverflow.com/questions/13694062/css-left-center-right-align-text-on-same-line)\
**HTML:** Page content after button press -------------------------------------------- [stackoverflow.com/...](https://stackoverflow.com/questions/37329226/how-to-check-page-content-after-button-click-correctly)\
**HTML:** Unicode -------------------------------------------------------------------- [compart.com/...](https://www.compart.com/en/unicode/U+1F469)\
**RAILS:** Database update following button click ------------------------------------ [stackoverflow.com/...](https://stackoverflow.com/questions/29762446/update-database-when-click-button-using-ruby-on-rails)\
**RSPEC:** Testing flash messages ---------------------------------------------------- [stackoverflow.com/...](https://stackoverflow.com/questions/24919976/rspec-3-how-to-test-flash-messages)\
**HTML/CSS:** Page layout ------------------------------------------------------------ [kidsbizclub.org/...](https://kidsbizclub.org/course-2-organize-your-business/section-3-website-design-skills/lesson-2-11-page-layout-with-css-grid)\
**HTML/CSS:** Color schemes ---------------------------------------------------------- [colorcombos.com/...](https://www.colorcombos.com/color-schemes/52/ColorCombo52.html)\
**RAILS:** Unique values extraction from columns ------------------------------------- [stackoverflow.com/...](https://stackoverflow.com/questions/8369812/rails-how-can-i-get-unique-values-from-column)\
**RAILS:** Unique values extraction from columns ------------------------------------- [stackoverflow.com/...](https://stackoverflow.com/questions/8369812/rails-how-can-i-get-unique-values-from-column)\
**RAILS:** Reposition dealer to the top ---------------------------------------------- [stackoverflow.com/...](https://stackoverflow.com/questions/12714186/reposition-an-element-to-the-front-of-an-array-in-ruby#12717770)



Work Cited:\
https://stackoverflow.com/questions/12714186/reposition-an-element-to-the-front-of-an-array-in-ruby#12717770 \
https://kidsbizclub.org/course-2-organize-your-business/section-3-website-design-skills/lesson-2-11-page-layout-with-css-grid \
https://stackoverflow.com/questions/16005281/rspec-how-to-assign-instance-variable-in-controller-spec/16005967 \
https://stackoverflow.com/questions/2224790/how-do-i-check-if-a-string-has-at-least-one-number-in-it-using-ruby \
https://apidock.com/rails/ActionView/Helpers/FormTagHelper/select_tag \
https://stackoverflow.com/questions/12284044/how-to-split-page-into-4-equal-parts \
https://stackoverflow.com/questions/11515554/how-do-i-use-unicode-in-a-button-rails-form-for \
https://stackoverflow.com/questions/13694062/css-left-center-right-align-text-on-same-line \
https://stackoverflow.com/questions/37329226/how-to-check-page-content-after-button-click-correctly \
https://www.compart.com/en/unicode/U+1F469 \
https://stackoverflow.com/questions/29762446/update-database-when-click-button-using-ruby-on-rails \
https://stackoverflow.com/questions/24919976/rspec-3-how-to-test-flash-messages \
https://www.colorcombos.com/color-schemes/52/ColorCombo52.html \
https://stackoverflow.com/questions/8369812/rails-how-can-i-get-unique-values-from-column



Within the database we needed to make sure that all cards have unique locations. To be able to accurately present the user with an efficient interface we needed a simple way of organizing our database. Using integers we make a lookup table of the different locations for our cards to be in within our database. This lookup table if you want to call it as such is seen here.
          
          status: 0 unused, 1 in play, 2 in hand in play, 3 in hand action, 4 on board, 5 discard
