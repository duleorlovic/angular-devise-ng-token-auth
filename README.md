# Demo for angular-devise and ng-token-auth

There are two approaches for authentication

* [angular_devise](https://github.com/cloudspace/angular_devise)
* [ng-token-auth](https://github.com/lynndylanhurley/ng-token-auth)

This is just demonstration how to use it. Installing commands you can find on
[my-blog](http://blog.trk.in.rs/2015/12/20/devise-oauth-angular/#tocAnchor-1-8)

# Server

Use port 3004 or update it in client config

~~~
rails s -p 3004
~~~

You can create user and articles on http://localhost:3004 and check that only
signed in user can access http://localhost:3004/articles.json

# Angular Devise

~~~
cd client
gulp serve
~~~

This will open browser, probably on http://localhost:3000/#/
You should open console log to see what hapens when you click on Login, Logout,
currentUser, and Get Article.

# Ng token auth

Stop the cliend and server process, change branch to ng-token-auth, and run same
commands as for angular-devise (`rails s -p 3004;cd client;gulp serve`)

~~~
git chechout -t origin/ng-token-auth
~~~

