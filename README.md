# Simple Blog

Simple Blog is a basic blogging platform where users can create and comment on articles. It includes features for user authentication, article management, and comments.

## Requirements

- **Ruby version:** 3.2.3
- **Rails version:** 7.1.3.4
- **Database:** MySQL
  
## System Dependencies

- **MySQL:** Used as the database server.
- **Node.js and Yarn:** Required to manage JavaScript dependencies.

## Installation and Setup

To run the project locally, follow these steps:

#### Clone the repository:
    
    git clone https://github.com/username/simple-blog.git


#### Navigate to the project directory:

    cd simple_blog

#### Install dependencies:

    bundle install
    yarn install

#### Update the database configuration:

Edit the config/database.yml file to configure MySQL with your username and password.

#### Create the database and run migrations:

    rails db:create
    rails db:migrate

#### Precompile assets:

    rails assets:precompile

#### Start the Rails server:

    rails server

Visit http://localhost:3000 in your browser to view the application.

#### Configuration

User Authentication: Managed using Devise.
Articles: Includes CRUD operations for managing articles.
Comments: Users can add comments to articles.

## Services
#### Email Configuration

The application uses SMTP for email delivery. Configure config/environments/development.rb for your email provider:

```
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
config.action_mailer.delivery_method = :smtp
config.action_mailer.perform_deliveries = true
config.action_mailer.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 587,
  domain: 'gmail.com',
  user_name: 'yourmail@gmail.com',
  password: 'your application password than you can take from gmail',
  authentication: 'plain',
  enable_starttls_auto: true
}


