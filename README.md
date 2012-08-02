== Ruby on Rails Test

== Task

Create a sample API using Ruby on Rails that will enable management of very simple Page objects.
Each Page object must have the following attributes:

1. title (required unique string)
2. content (required string)
3. published_on (optional datetime)
4. timestamps

A page will be deemed to be unpublished if the 'published_on' attributes is nil or it datetime is set to
sometime in the future

The API must respond to the following CRUD routes

api_pages       GET         /api/pages
                POST        /api/pages
new_api_page    GET         /api/pages/new
edit_api_page   GET         /api/pages/:id/edit
api_page        GET         /api/pages/:id
                PUT         /api/pages/:id
                DELETE      /api/pages/:id

== ...as well as the following...

   # Return a list of published pages sorted published_on DESC
   published_api_pages GET /api/pages/published
   # Return a list of unpublished pages sorted by published_on DESC
   unpublished_api_pages GET /api/pages/unpublished
   # Set a Page to published immediately (ie. current timestamp)
   publish_api_page POST /api/pages/:id/publish
   # Return the total number of words (title and content) for the given page
   total_words_api_page GET /api/pages/:id/total_words


== Notes
    All code must contain appropriate validations and migrations contain appropriate table
    constraints and indexes
    The application must respond to both JSON and XML requests only (no HTML)
    Code must be well documented
    Bonus points if you include features / tests / specs


== Submission
    So that we can assess you code, you must also provide the following:

    1. Please create and develop the application on Github and provide us with a link to the repository
    2. Create and deploy your application on Heroku (it's free) and provide us with the URL to test
    functionality
    3. Provide us with the URLs for the Github repository and the Heroku application so we can do a
    code review