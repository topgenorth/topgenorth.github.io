--- 
date: "2008-01-22T00:00:00Z" 
status: publish 
categories: 
    - Programming 
title: Continous Database Integration With Nant 
type: post 
---

Last night I spent some quality time looking at [vincent-vega](http://code.google.com/p/vincent-vega/), aka Continuous Database Integration for SQL Server. This is a pretty simple and handy task for Nant that helps bring continous integration to your databases. I use updateSqlDatabase like as part of my integration tests like so:

1.  Drop the database
2.  Create a new database
3.  Run some SQL scripts to bring my database up to date
4.  Run various database integration tests, repeating steps 1 -3 as necessary.

What this project will add a new task you: updateSqlDatabase. With this task, you can do one of three things: Add a database, Create a Database, and Update a database. updateSqlDatabase will look for SQL script files , and will execute those SQL scripts for you in the order they are found. Information about what scripts have been run are kept in a table that updateSqlDatabase creates for you when you create your database.  This will allow you to see the history of when your database was updated, and with scripts.  This\
How to get started and use it? First, [get the code](http://code.google.com/p/vincent-vega/source) from Google Code. Compile the code. Next copy the output of the build to your Nant bin directory.  See the image below.  You probably won't need log4net.dll or Nant.Core.\*.


Next use the updateSqlDatabase task to perform the drop/create/update as desired. And how do you do that? Well allow me to use athe build from [Code Camp Server](http://www.codecampserver.org) as an example. Here are three targets from the nant script:

```xml
<target name="create-database" depends="version, init">
    <echo message="Creating database ${database.name}..."/>
    <updateSqlDatabase scriptDirectory="${database.dir}" action="Create" server="${database.server}" database="${database.name}" />
    <echo message="Current Database Version: ${usdDatabaseVersion}" />
</target>

<target name="drop-database">
    <echo message="Dropping database ${database.name}..."/>
    <updateSqlDatabase action="Drop" database="${database.name}" server="${database.server}" failonerror="false" />
</target>
<target name="update-database">
    <echo message="Updating database..."/>
    <updateSqlDatabase scriptDirectory="${database.dir}" action="Update" server="${database.server}" database="${database.name}" />
    <echo message="Current Database Version: ${usdDatabaseVersion}" />
</target>
```

In these samples, we're assuming integrated security. If you were using SQL authentication, you can, but I'm not going to cover that. Look at the code for how to do that.  It's good for you to read other peoples code.  Anyway, here is an explaination of the parameters for the task:

- action: one of Add/Update/Drop. Note that this action is also used by updateSqlDatabase to find the script files to run.
- scriptDirectory: This will hold our database scripts. Note that they must have the .SQL extentsion.  Inside this directory we create one or two folders which will hold our scripts.  So, what are the rules surrounding the locating of SQL script files?  Basically, it goes something like this:\
  *For a Create action*:  get the scripts from first the Create folder (if there is one), and then the scripts from the Update folder.  The scripts in the Create folder get run first, then the scripts from the Update folder.\
  *For an Update action*:  get the scripts from the Update folder.  Run them.\
  *For the Drop action*:  Ignore all the folders.  Don't execute any scripts.


- server: The database server that the scripts will be run against.

<!-- -->

- database: The database the scripts will be run against.

My only complaint about it is that it's SQL Server only (for now). But, I won't complain to loud, as I suppose on the eighth day I could probably add support for MySQL to the project.

Now, why would I go through all this?  Here is a quick summary of why I think it's worth effort (in case the 'continous integration' didn't give it away):

1.  It helps me ensure that the database I think I'm testing against is the database that I should be testing against.  It minimizes the friction of integration testing when you don't have to chase down and resolve schema or data issues. 
2.  Exercise and test any database scripts that might have to be applied in production. 
3.  I can keep my schema in my source code management tool and manage changes to my database.
