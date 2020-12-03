# Sinatra_Project

├── CONTRIBUTING.md
├── Gemfile
├── Gemfile.lock
├── LICENSE.md
├── README.md
├── Rakefile
├── app
│   ├── controllers
│   │   ├── application_controller.rb
│   │   ├── tweets_controller.rb
│   │   └── users_controller.rb
│   ├── models
│   │   ├── tweet.rb
│   │   └── user.rb
│   └── views
│       ├── index.erb
│       ├── layout.erb
│       ├── tweets
│       │   ├── new.erb
│       │   ├── edit_tweet.erb
│       │   ├── show_tweet.erb
│       │   └── tweets.erb
│       └── users
│           ├── create_user.erb
│           └── login.erb
│           └── show.erb
├── config
│   └── environment.rb
├── config.ru
├── db
│   ├── development.sqlite
│   ├── migrate
│   │   ├── 20151124191332_create_users.rb
│   │   └── 20151124191334_create_tweets.rb
│   ├── schema.rb
│   └── test.sqlite
└── spec
    ├── controllers
    │   └── application_controller_spec.rb
    ├── models
    │   └── user_spec.rb
    └── spec_helper.rb