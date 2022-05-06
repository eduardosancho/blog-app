![](https://img.shields.io/static/v1?label=BY&message=eduardosancho&color=purple)
![](https://img.shields.io/badge/Microverse-blueviolet)

# Blog App
![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)

## Preview
![screenshot](./screenshot.png)
<hr>

## Table of Contents

- [Description](#description)
- [Built With](#built-with)
- [Getting Started](#getting-started)
  - [Clone Repo](#clone-repo)
  - [Prerequisites](#prerequisites)
  - [Install Rails](#install-rails)
- [Setup](#setup)
  - [System Dependencies](#system-dependencies)
  - [Database Creation](#database-creation)
  - [Database Initialization](#database-initialization)
- [Usage](#usage)
  - [Start Server](#start-server)
  - [Testing Rails](#testing-rails)
  - [Testing RSpec](#testing-rspec)
- [How To Contribute?](#how-to-contribute)
- [Collaborators](#collaborators)
- [Show Your Support](#how-your-support)
- [Acknowledgments](#acknowledgments)
- [License](#license)
<hr>

## Description
> 'Social media' -like app that allows for users to sign in to their accounts, create posts of their own, and comment and like other people's.
<hr>

## Built With

- Major languages: Ruby, HTML, CSS.
- Frameworks: Ruby on Rails.
- Tools & Methods: RSpec for Testing, PostgreSQL for Database.
<hr>

## Getting Started

We'll need to prepare your computer to handle Ruby on Rails, which might be a hassle, so take a deep breath and cope with me :)

## Clone Repo

First clone this repo by running this command in your terminal:
~~~ bash
git clone https://github.com/eduardosancho/blog-app.git
# wait a couple seconds for it to download
# ...
# ...
# then move into the new directory
cd blog-app
~~~

<hr>

## Prerequisites

The following technologies must be installed before hand in your local machine:

 - Ruby (ruby --version). Should be 2.2.2 or newer.
 - SQLite3 (sqlite3 --version)
 - Node.js (node --version)
 - Yarn (yarn --version)  

The commands in parenthesis `()` can be used to verify if they are installed and their corresponding versions.

Refer to [Section 3](https://guides.rubyonrails.org/v5.1/getting_started.html#:~:text=3%20Creating%20a%20New%20Rails%20Project) from the official [Rails Guide](https://rubyonrails.org/) for more detailed instructions on how to install these technologies.

### Install Rails
Once that's done, we can install Rails. For that, run these commands in your terminal:
~~~ bash
gem install rails
# wait a few seconds for it to download
# ...
# ...
# verify that it was installed by running
rails --version
~~~
<hr>

## Setup

We're getting there... trust me ;)

## System Dependencies

Execute this command to automatically install all the dependencies needed to view and work on this project:

~~~ bash
bundle install
~~~

The full list of dependencies can be found within the [Gemfile](https://github.com/eduardosancho/blog-app/blob/development/Gemfile).

This also installs PostgreSQL, which you'll need for the next step.
<hr>

## Database Creation

The following command will create the database in your local machine.
~~~ bash
rails db:create
~~~

## Database Initialization
To initialize the database we just created, now run:
~~~ bash
rails db:schema:load
~~~

## Database Populate Default
To populate the database with some minimal info run:
~~~ bash
rails db:seed
~~~
<hr>

## Usage
If you got to this point, congratulations! You now have spent 2 hours in order to toy with my app. I appreciate your effort :P

## Start Server
The following command should start a server
~~~ bash
rails server
~~~
Which you can visit by going to http://localhost:3000 in your browser.
<hr>


## Testing Rails
The default folder for tests in rails is [/test](/test/).

In order to run the tests located in the test folder run:
~~~ bash
rails test
~~~

## Testing RSpec
RSpec tests belong in another folder, which is [/spec](/spec/), all thanks to the ruby **magic** called `naming conventions`.
Anyway, to run tests located in the spec folder run:
~~~ bash
rspec
~~~
<hr>

## How To Contribute?

Always remember to commit your contributions on a different branch. You can create a new one by running `git checkout -b <branchname>`.

Visit [linters folder](.github/workflows/linters.yml) to learn how to setup linters.

Then check linters locally before pushing by running:
~~~ bash
npx stylelint "**/*.{css,scss}"
# ...
# ...
rubocop --color -A
~~~

Finally, once your changes have no linter errors and all [tests](#testing-rails) are passing, try to merge your branch into  `development` by running:
~~~ bash
git checkout development
git merge <branchname>
~~~
Continue by solving any merge conflicts that may arise, test the functionality of the app once more, and you're changes are ready to be pushed with `git push origin <branchname>`
<hr>

# And that's pretty much it for the instructions!

## Collaborators
👤 **Eduardo**

 Platform | Badge |
 --- | --- |
 **GitHub**  | [@eduardosancho](https://github.com/eduardosancho)
 **Twitter** | [@sanchitobless](https://twitter.com/sanchitobless)
 **LinkedIn** | [Eduardo Sancho Solano](https://www.linkedin.com/in/eduardo-sancho-solano/)
<hr>
 

## Show your support

Give a ⭐️ if you like this project!
<hr>

## Acknowledgments

The ideas and inspiration from this project are coming from this online school of software development:

## [**Microverse**](https://www.microverse.org/)
<hr>

## 📝 License

This project is [MIT](./MIT.md) licensed.
