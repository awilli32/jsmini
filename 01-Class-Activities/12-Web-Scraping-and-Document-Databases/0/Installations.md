# Web Scraping and Document Databases

## Installation Prework
This document outlines the installation and configuration prework that is required for the Web Scraping and Document Databases module. 

Please complete all of the installation steps *before class on Saturday* and post any issues in the `#homework` channel.

- - - 

### MongoDB Community Edition and MongoDB Compass
#### **Step 1: Install MongoDB Community Edition**

* Windows: https://docs.mongodb.com/manual/tutorial/install-mongodb-on-windows/
* Mac: https://docs.mongodb.com/manual/tutorial/install-mongodb-on-os-x/


Please follow every step in the tutorial (please do not miss any steps), including the post-install set up steps. 
  * **For Windows Users**: Be sure to create the `data` directory and add MongoDB to your system PATH environment variable. Please select the option to also install **MongoDB Community Edition**. If presented with the option. (If you were not presented with an option, then you will have the opportunity later.) 
  * **For Mac Users**: Be sure to follow every step in the tutorial. Please select the option to also install **MongoDB Community Edition**. If presented with the option. (If you were not presented with an option, then you will have the opportunity later.) 
	
#### **Step 2: Verify the MongoDB Community Edition Install**
Start up MongoDB by typing `mongod` into your terminal or bash windows. Your terminal/bash screens should look something like this:
	
![mongod image](Images/mongod.png)

#### **Step 3: Install MongoDB Compass**
  
If you did not install MongoDB Compass during the previous step, then you can install it separately by using these steps:

* Access the MongoDB Compass download page: https://www.mongodb.com/try/download/compass
* Select **On-Premises**
* After selecting On-Premises select **MongoDB Compass** as the product that you would like to download. 
* Select the appropriate operating system, and proceed with the download and install.

- - - 

### PyMongo, Splinter and ChromeDriver Setup

#### **Step 4: Complete `pip` Installs**
You will need to complete the following `pip` installs for the Unit 12.

From within Jupyter Notebook (recommended), please run:
* `!pip install pymongo`
* `!pip install bs4`
* `!pip install lxml`
* `!pip install webdriver_manager`
* `!pip install html5lib`
* `!pip install splinter`
* `!pip install chromedriver`

If using Anaconda Prompt or your terminal, please run:
* `pip install pymongo`
* `pip install bs4`
* `pip install lxml`
* `pip install webdriver_manager`
* `pip install html5lib`
* `pip install splinter`
* `pip install chromedriver`

If you are having problems with `pip`, try using `pip3` instead.

#### **Step 5: Spinter and ChromeDriver setup**

To set up Splinter and ChromeDriver, please see [this document](https://splinter.readthedocs.io/en/latest/drivers/chrome.html) and ensure that all of the setup components have been addressed.

**Be sure to check your version of Google Chrome** to select the right version of ChromeDriver to install.

To check your version of Google Chrome, click Help > About Google Chrome from the menu bar in Chrome.

For **Windows Users**, you must follow the steps to download `ChromeDriver.exe`, place it in a folder on your machine and add that folder to your PATH environment variable.

- - - 

#### **Step 6: Test your Configuration (IMPORTANT)**

In this final step, you will need to run a Jupyter Notebook to confirm that the script runs without error.

Depending on your operating system, run one of the scripts below in Jupyter Notebook:
* `WINDOWS_PyMongo_Splinter_Test.ipynb` for Windows users
* `MAC_PyMongo_Splinter_Test.ipynb` for Mac users

Run the entire script. If it completes without error, then you are all set. If you encounter an error, check the installation and configuration steps above and report your issue(s) to the #homework channel. Please work with your tutor and/or TAs for support.

- - -

### Support
As a reminder, please complete these installs **before class on Saturday**. 

If you are having problems with installation or configuration. we've got several options to support you including: :
* I can run an optional installation and configuration session on Friday, December 11 at 6 pm for Windows Users and 6:45 pm for Mac users. I will record the sessions. 
* Work with your TAs, Heather or Darick or your tutor to resolve install issues.
* During office hours on Saturday, breakout rooms will be set up before class during office hours. 
* If you are having problems, I need to know ASAP. Please post any unresolved issues to the `#homework` channel.

Keep in mind that during class hours, there will be **no time will be allocated to installation and configuration**. However, breakout rooms will be available for anyone who may be having issues. We will only take ~10 to 15 minutes to verify installs.