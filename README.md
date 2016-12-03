# automate-placeholder
I wrote this for an assignment done for my brother at [Themeforest.](https://themeforest.net/user/thecreo)

# How it works
This script/converted exe (Windows only) searches relative directory(directories) for images (\*.jpg, \*.png) and goes to http://placehold.it for their appropriate placeholder, downloads it, and **replaces** the original images.

# Usage
This can be used in two forms.
- Ruby script: you need to download all the gems necessary. Then run in terminal: `ruby placeholder.rb` (NON-WINDOWS)
- Exe File: you need to download gem [ocra](https://github.com/larsch/ocra), then create an exe file. (WINDOWS ONLY)

## Why PhantomJS?
I chose phantomjs because it's headless, and Chrome/Firefox/IE Drivers needs to be added in the path, so that's another hassle.

### Windows
- Download phantomjs from [here](http://phantomjs.org/).
- Extract *phantomjs.exe*.  
- Keep it in the same folder as **placeholder.rb** file.   

### Mac
- On Terminal: `brew install phantomjs`  

## Run

### Windows
On windows you can create an Exe using ocra.

- On cmd, type `gem install ocra`
- Then `ocra placeholder.rb`  
- An .exe file is created. Double click it to run.

### Mac
On mac, ocra does not work. So:
- On terminal, type `ruby placeholder.rb`

#License

Read from [Here](https://github.com/rakib-amin/automate-placeholder/blob/master/LICENSE).
