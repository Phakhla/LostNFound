# Introduction
TODO: Give a short introduction of your project. Let this section explain the objectives or the motivation behind this project.

### Prerequisites
- Ruby 3.1.2
- PostgreSQL 9.3.x or later
- Redis
- Node.js
- Yarn

### Getting Started
1. Install bundler
```
gem install bundler
```

2. Install dependencies
```
bundle install
yarn install
```

3. Set ENV vars
```
cp config/application.yml.example config/application.yml
```
Check this file, and change your ENV values

4. Create database and update schema
```
rails db:prepare
```

5. Development
```
gem install foreman
./bin/dev
```
