<h1 align="center">Tea Subscription</h1>

<!-- TABLE OF CONTENTS -->
  <details>
  <summary>Table of Contents</summary>
  <ol>
    </li>
    <li><a href="#project-overview">Project Overview</a></li>
    <li><a href="#built-with">Built With</a></li>
    <li><a href="#setup">Setup</a></li>
    <li><a href="#schema">Schema</a></li>
    <li><a href="#api-endpoints">API Endpoints</a></li>
  </ol>
</details>

<!-- PROJECT OVERVIEW -->
## Project Overview
This is a Rails RESTful API app that is designed to create, update, and delete tea subscriptions for customers.

<!-- Built With -->
## Built With
[<img src="https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white"/>](https://www.ruby-lang.org/en/) **Version 2.7.4**<br>
[<img src="https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white"/>](https://rubyonrails.org/) **Version 5.2.8**<br>

<!-- Setup -->
## Setup
To set up the project on your local machine, complete the following steps:
1. Ensure you have the correct versions of both Ruby(2.7.4 or later) and Rails(5.2.8 or later) by running `ruby -v` and `rails -v` from your command line.<br>
2. Clone the repo:
```git clone git@github.com:sdecesari/tea_subscription_service.git``` &mdash; for SSH
4. Install gems using `bundle install`
5. Set up local database: `rails db:{drope,create,migrate,seed}
6. Launch your server: `rails s`


<!-- Schema -->
## Schema



<!-- API Endpoints -->
## API Endpoints
#### Create a Tea Subscription for a Customer
`POST /api/v1/subscribe`<br

`DELETE /api/v1/unsubscribe`<br>

`GET /api/v1/subscriptions/1`<br>
<br>
  