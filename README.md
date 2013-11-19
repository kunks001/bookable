# Bookable

[![Gem Version](https://badge.fury.io/rb/bookable.png)](http://badge.fury.io/rb/bookable)

Bookable is a Rails 4.0 gem that enables you to add resource booking functionality to your Rails application. A resource can be anything that is bookable e.g. tennis court, football pitch, bowling lane, function room, conference room, office space.

## Installation

Bookable works with Rails 4.0. Add this line to your application's Gemfile:

    gem 'bookable', '~> 0.0.52'

Then execute:

    $ bundle

Or install it yourself as:

    $ gem install bookable

After you've installed the gem, you need to run the generator:

    $ rails generate bookable:install

Alternatively you can specify a named resource by providing an argument to the rails generate command e.g. 

    $ rails generate bookable:install tennis_court

The generator will create the file structure you need to implement booking functionality into your app:
<ul>
  <li>controllers</li>
  <li>models - resource(tennis_court) and booking</li>
  <li>views</li>
  <li>javascript - which uses the jquery fullcalendar plugin</li>
  <li>css - some basic css is provided which you may want to override</li>
</ul>
The necessary routes will be applied to your routes file and you will need to run

    $ rake db:migrate

## Validations

Validations have been created for the models to ensure that a bookable resource is created with a unique name and bookings are created in the future and resources are not double booked. For further information, refer to the tests and for an example of how the gem is used, visit <a href="http://cafe-reviews.herokuapp.com/cafes/1/tables/">this site</a>.

## Known Bugs
<ul>
  <li>Front end Date validation, for example 30th February is not a valid date but is permitted by the calendar view. </li>
  <li>Implement server side date validation for above - currently if a booking for 30th February is entered, the booking will be created for 2nd March.</li>
</ul>

## Contributing
There are a number of desired features we hope to implement in the future. If you wish to contribute please do so in the following manner. 

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Desired Features
<ul>
  <li>optional description attribute for booking and resource models</li>
  <li>implement show route for bookings</li>
  <li>provide fix for Known Bugs</li>
</ul>

## Contributors
<ul>
  <li><a href="https://github.com/kunks001">Srikanth Kunkalugunta</a></li>
  <li><a href="https://github.com/chewymeister">Jon Tsang</a></li>
  <li><a href="https://github.com/margOnline">Margo Urey</a></li>
</ul>

## License

Bookable is released under the <a href="https://github.com/kunks001/bookable/blob/master/LICENSE.txt">MIT License</a>.


