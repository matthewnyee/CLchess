#CLchess

CLI chess game built using Ruby. Currently a work in progress, with most of gameplay functional.

###Features

* Graphical user interface for playing (moving cursor/moving pieces), player inputs recorded on keyboard.
* Users play against random move generator
* Code kept DRY by extracting common piece movements into shared classes (sliding pieces/stepping pieces), each piece inheriting from these movement classes.

###Instructions

* Download this repository
* Open CLI and navigate to clchess directory
* Install [colorize gem](https://rubygems.org/gems/colorize/versions/0.7.7) (`gem install colorize`)
* Play game by opening game.rb file in ruby (`ruby game.rb`)
