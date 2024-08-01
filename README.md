# NextChapter Invoice Management

## Stack
- Ruby 3.3.3
- Rails 7.1
- Postgres 14
- Docker

## Getting Started
Before starting, make sure you have Ruby and Docker installed

### How to start application
1. Start Postgres using Docker by running `docker-compose up`
2. Install gems by running `bundle install`
3. Run any pending migrations by `rails db:migrate`
4. For the first run, run seed script to create test users `rails db:seed`
5. Start the application by running `rails server`
6. Access the application in `http://localhost:3000`

### Test credentials (Only email)
John Doe (john.doe@example.com)
Jane Doe (jane.doe@example.com)
