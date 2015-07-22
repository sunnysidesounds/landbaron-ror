# LandBaron
Real Estate Investing ReImagined

## Getting Started

*Note: This assumes you have Ruby 2.1.x or later installed properly and have a
basic working knowledge of how to use RubyGems*

First you'll need to fork and clone this repo

```bash
git clone https://github.com/landbaronclub/landbaron.git
```

Move /public/system folder so the images stay intact

```bash
cp landbaron backup
cp -R /backup/public/system landbaron/public/
```
Let's get all our dependencies setup:

```bash
bundle install --without production
```
Note: this sometimes requires sudo if all the gems do not install

Now let's create the database:

```bash
rake db:migrate
```

If you're using the payment options component (use_payment_options = true in
settings.yml) then need to seed some data for the options:

```bash
rake db:seed
```

Let's get it running with Puma:

```bash
sudo nohup bundle exec puma -b 'unix:///tmp/landbaronclub-puma.sock?umask=0111' &
```

### Customizing

While it is a skeleton, to change around the product name, tweet text and more,
open this file:

```
config/settings.yml
```

To change around the colors and fonts, open this file:

```
app/assets/stylesheets/variables.css.scss
```

To dive into the code, open this file:

```
app/controllers/preorder_controller.rb
```

### Deploying to Production

We recommend using Heroku, and we even include a ```Procfile``` for you. All you
need to do is first install the [Heroku Toolbelt](https://toolbelt.heroku.com)
and then run:

```bash
heroku create
git push heroku master
heroku run rake db:migrate
heroku open
```
## Contributing


## License

LandBaron is licensed under the [MIT License](LICENSE.md).

## Terms and Conditions

All Submissions you make to Land Baron Club. (“LandBaronClub”) through GitHub are subject
to the following terms and conditions:

1.	You grant Land Baron Club a perpetual, worldwide, non-exclusive, no charge, royalty
free, irrevocable license under your applicable copyrights and patents to
reproduce, prepare derivative works of, display, publically perform, sublicense
and distribute any feedback, ideas, code, or other information (“Submission”)
you submit through GitHub.

2.	Your Submission is an original work of authorship and you are the owner or
are legally entitled to grant the license stated above.
