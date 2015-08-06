Codelitt
==========

## Description
Awesome company website!

## Installation

- Create gemset

      ```
      rvm use 2.1.1@codelitt --create
      ```

- Install gems

      ```
      bundle install
      ```
      
- Generate secret token

      ```
      rake secret
      ```
      
- Put secret token in line 12 of config/initializers/secret_token.rb

      ```
      Codelitt::Application.config.secret_key_base = 'YOUR_TOKEN_HERE'
      ```

- Run the server

      ```
      rails server
      ```

- Watch stylesheets for changes

      ```
      compass watch
      ```

## Setup
- Breakpoint: http://breakpoint-sass.com/
  - For easier media queries
- Compass: http://compass-style.org/
  - To modularize our scss using partials.
- Bootstrap: http://getbootstrap.com/
  - Use bootstrap for easier css and responsive design.

## Stylesheets
- We are using SASS(SCSS) for stylesheets.
- They are stored in the public/sass folder and compiled to CSS in the
public/stylesheets folder.
- The stylesheet folder is not committed in order to keep the repo DRY.

### Partials
- We are using partials for each element of the page.
- All partials are called in application.scss.
- The layout.erb then links to the compiled application.css.

### Media Queries
Media queries are simple using the breakpoint gem.

##### Variables
Use the same values as bootstrap for media queries.
```css
  $sm: 768px;
  $md: 992px;
  $lg: 1200px;
```

##### Example:  
Using breakpoint we can set the height to auto if the page width is bigger
than 768px which is our $sm value.
```css
   .codelitt-big {
      margin: -20px 0 0;
      padding: 0;
      width: 100%;
      height: 400px;

      background: $codelitt-dark;

      @include breakpoint($sm) {
        height: auto;
    }
```
