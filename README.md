# Arkham Guide

Web-application for the LCG Arkham Horror to manage your game status.
## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)

## General info
This project is a Rails application to to keep track of your Campaigns, Players and Investigators.
 
	
## Technologies
Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

Project is created with:
* Ruby version: 2.6.6
* Rails version: 6.0.3.5
* Devise for Authentification
* Pundit for Authorization

	
## Setup
install the gems, required by the application:
```
$ bundle install
```
execute the database migrations/schema setup:
```
$ rails db:migrate 
$ rails db:seed
```
start the rails app:
```
$ rails server
```

![ArkhamGuideHome](https://user-images.githubusercontent.com/60921907/112457943-856db800-8d5c-11eb-987f-653bb354c90a.png)
![ArkhamGuideShow](https://user-images.githubusercontent.com/60921907/112457625-39bb0e80-8d5c-11eb-84ce-38b3ae947a57.png)
