# Alfresco Login Reset

Alfresco plugin to reset the password of internal Alresco users.
This plugin uses the built in workflow of Alfresco (since version 5.2e) 
to reset a password.

* Suitable for internal users. Does not work for AD users - Alfresco can't write to Active Directory.
* Works for Alfresco 6.0 and 6.2 (tested). Other accessible plugins only work until 6.0.

Created by RSM Switzerland AG, 2020

### Todo:
* Now the user has to enter the username together with the password. Read username from Task. How?
* Get rid of [object HTMLDivElement] message after sucessfully changing password
* Check security
* Tests
* Beautify email templates (see below)

### Dependencies

* Alfresco Community, tested with version 6.0 and 6.2, 5.2e and newer should work. Not tested with Enterprise.
* The following settings are needed in alfresco-global.properties:
```properties
repo.client-app.custom-email.requestResetPasswordTemplatePath=app:company_home/app:dictionary/app:email_templates/cm:custom-email/cm:forgot-password.ftl
repo.client-app.custom-email.resetPasswordPageUrl=${shareUrl}/page/reset-password
repo.client-app.custom-email.confirmResetPasswordTemplatePath=app:company_home/app:dictionary/app:email_templates/cm:custom-email/cm:reset-password.ftl
```
* Email templates in the paths mentions in the properties. Examples used for 
RSM Switzerland AG see in the email-templates folder for the platform part.

### Based on

This plugin is based on the ideas of the following repository. 
It is not simply copied, but the base knowledge is layed by 
https://github.com/FlexSolution/AlfrescoResetPassword 

Many thanks to FlexSolution for their source.

### Programming

This is an All-In-One (AIO) project for Alfresco SDK 4.1.

Run with `./run.sh build_start` or `./run.bat build_start` and verify that it

 * Runs Alfresco Content Service (ACS)
 * Runs Alfresco Share
 * Runs Alfresco Search Service (ASS)
 * Runs PostgreSQL database
 * Deploys the JAR assembled modules
 
All the services of the project are now run as docker containers. The run script offers the next tasks:

 * `build_start`. Build the whole project, recreate the ACS and Share docker images, start the dockerised environment composed by ACS, Share, ASS and 
 PostgreSQL and tail the logs of all the containers.
 * `build_start_it_supported`. Build the whole project including dependencies required for IT execution, recreate the ACS and Share docker images, start the 
 dockerised environment composed by ACS, Share, ASS and PostgreSQL and tail the logs of all the containers.
 * `start`. Start the dockerised environment without building the project and tail the logs of all the containers.
 * `stop`. Stop the dockerised environment.
 * `purge`. Stop the dockerised container and delete all the persistent data (docker volumes).
 * `tail`. Tail the logs of all the containers.
 * `reload_share`. Build the Share module, recreate the Share docker image and restart the Share container.
 * `reload_acs`. Build the ACS module, recreate the ACS docker image and restart the ACS container.
 * `build_test`. Build the whole project, recreate the ACS and Share docker images, start the dockerised environment, execute the integration tests from the
 `integration-tests` module and stop the environment.
 * `test`. Execute the integration tests (the environment must be already started).

#### Few things to notice

 * No parent pom
 * No WAR projects, the jars are included in the custom docker images
 * No runner project - the Alfresco environment is now managed through [Docker](https://www.docker.com/)
 * Standard JAR packaging and layout
 * Works seamlessly with Eclipse and IntelliJ IDEA
 * JRebel for hot reloading, JRebel maven plugin for generating rebel.xml [JRebel integration documentation]
 * AMP as an assembly
 * Persistent test data through restart thanks to the use of Docker volumes for ACS, ASS and database data
 * Integration tests module to execute tests against the final environment (dockerised)
 * Resources loaded from META-INF
 * Web Fragment (this includes a sample servlet configured via web fragment)

#### TODO

  * Abstract assembly into a dependency so we don't have to ship the assembly in the archetype
  * Functional/remote unit tests