## Unit 13 - Salesforce and AWS Relational Database Service (RDS)

### Objectives

* Create a Salesforce application and explore its features.
* Create and connect to a MySQL database on AWS.
* Use the Salesforce API to load data using Python.

- - -

### Getting Started

#### Creating an AWS Account
* Navigate to https://aws.amazon.com
* Create your AWS account
    * In the menu bar, click **Create an AWS account** or **Sign In to the Console**
        * If you chose Sign in to the Console and wish to create a new account, click **Create a new AWS account** on this page
    * Complete the sign up forms
    * When prompted, choose the **Basic (Free) Plan**
* Configure your database on AWS
    * On the AWS Management Console, search for RDS
        * RDS is Amazon's managed relational database service
    * From the Amazon RDS page, click **Create database**
    * On the Select Engine page, click **MySQL** and click **Next**
    * On the Choose Use Case page, click **Dev/Test - MySQL**
    * On the Special DB Details page **please check the _Only enable options eligible for RDS Free Usage Tier_ box**
    * In the Settings panel, name your database instance `codingbootcamp`, complete the required fields and click **Next**
    * On the Configure advanced settings page in the **Network & Security** panel, select "Create new VPC"
    * Choose "Yes" for **Public accessibility**
    * In the Database options panel, give you database a name
        * For this activity, name it `gwsis`
        * Leave the rest of the settings as they are
    * Accept the remainder of the default settings (or change them if you'd like) and click **Create databsae**
    * Wait a few moments for the database to create
*   Updating Security Settings
    * This step is important to ensure that you can connect to your MySQL database from your machine and other locations
    * On your database instance page, locate **Security group rules** and click one
    * In the Security Group panel, click the Inbound tab and change the settings as follows:
        * Click Edit, and select "Anywhere" under the Source column
        * Click Save

#### Creating a Salesforce Application (ONLY for those who opt into the Salesforce component)

* Navigate to https://developer.salesforce.com
* Create your Salesforce Developer Account
    * From the menu bar, click **Sign Up**
    * Complete the form and click **Sign me up**
    * Confirm your e-mail address (you can use the account that you used to create your Trailblazer account)
    * Set and confirm your Salesforce Developer account password
* Log in to Salesforce
* Explore Salesforce a bit
* Sign up for a [Trailblazer account](https://trailhead.salesforce.com/home)
    * We will complete part of the **Data Modeling** module

#### Getting Salesforce API Information

* Login to Salesforce at http:/login.salesforce.com (if you are not already logged in)
* Create a Connected App
    * In the Quick Find box, search for **App Manager** and click **App Manager**
    * On the Lightning Experience App Manager page, click **New Connected App**
    * Complete the required fields, naming it `GW Salesforce API`
    * Complete the rest of the required fields
    * Check Enable OAuth Settings
    * Check Enable for Device Flow
    * Select all OAuth Scopes and move to "Selected OAuth Scopes"
    * Save the Connected App
    * Once the Connected App has been saved, take note of the `Consumer Token` and `Consumer Secret`. You will need this for your `config.py` file.
* Confirm your Connected App
    * In the Quick Find panel, navigate to **Apps** > **Manage Connected Apps**
    * Find `GW Salesforce API` to confirm that it is there
* Reset your Securty Token
    * Click the icon in the far right corner of the header
    * Below your name, click the `Settings` link
    * In the left navigation, click **Reset Security Token**
    * Once you reset your token, check your e-mail and take note of it to add to your `config.py` file.

- - -

### Helpful Links

* [Salesforce Object Basics](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_concepts.htm)

* [Salesforce Standard Objects](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_list.htm)

* [Salesforce Creating Remote Applications](https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/intro_defining_remote_access_applications.htm)

* [Salesforce Trailhead: Understand Custom & Standard Objects](https://trailhead.salesforce.com/en/content/learn/modules/data_modeling/objects_intro)

* [AWS Overview of Database Instances](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.DBInstance.html)
