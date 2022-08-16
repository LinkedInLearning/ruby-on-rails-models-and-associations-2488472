# Ruby on Rails Models and Associations
This is the repository for the LinkedIn Learning course Ruby on Rails Models and Associations. The full course is available from [LinkedIn Learning][lil-course-url].

![Ruby on Rails Models and Associations][lil-thumbnail-url] 

Ruby on Rails can speed up and improve the development of full-featured web applications through powerful tools that provide an object-oriented interface to relational databases and automate common data tasks. In this course, extend your knowledge of Ruby on Rails as instructor Kevin Skoglund covers the built-in features of models and associations in Rails. Learn to apply named scopes, validations, callbacks, and associations to a sample project. Find out how to design smarter models with attributes not in the database and by leveraging efficient queries. Walk through the most useful built-in validation methods and learn to write custom validations. Discover how to trigger automated behaviors as data is saved to the database by using callbacks. Explore effective use of Active Record associations, investigate one-to-many and many-to-many relationships, and learn to construct queries that span several tables.

## Instructions
This repository has branches for each of the videos in the course. You can use the branch pop up menu in github to switch to a specific branch and take a look at the course at that stage, or you can add `/tree/BRANCH_NAME` to the URL to go to the branch you want to access.

## Branches
The branches are structured to correspond to the videos in the course. The naming convention is `CHAPTER#_MOVIE#`. As an example, the branch named `02_03` corresponds to the second chapter and the third video in that chapter. 
Some branches will have a beginning and an end state. These are marked with the letters `b` for "beginning" and `e` for "end". The `b` branch contains the code as it is at the beginning of the movie. The `e` branch contains the code as it is at the end of the movie. The `main` branch holds the final state of the code when in the course.

When switching from one exercise files branch to the next after making changes to the files, you may get a message like this:

    error: Your local changes to the following files would be overwritten by checkout:        [files]
    Please commit your changes or stash them before you switch branches.
    Aborting

To resolve this issue:
	
    Add changes to git using this command: git add .
	Commit changes using this command: git commit -m "some message"


## Installing
1. To use these exercise files, you must have the following installed:
	- Ruby 2.7 minimum, 3.0 or later preferred
	- Ruby on Rails 7
	- MySQL
2. Clone this repository into your local machine using the terminal (Mac), CMD (Windows), or a GUI tool like SourceTree.
3. Install the RubyGems needed for the project:
	- cd task_manager
	- bundle install
4. Configure the project database and import initial data:
	- Add credentials to config/database.yml
	- rails db:create
	- rails lil:import


### Instructor

Kevin Skoglund 
                            


                            

Check out my other courses on [LinkedIn Learning](https://www.linkedin.com/learning/instructors/kevin-skoglund).

[lil-course-url]: https://www.linkedin.com/learning/ruby-on-rails-models-and-associations
[lil-thumbnail-url]: https://cdn.lynda.com/course/2488472/2488472-1660331427377-16x9.jpg
