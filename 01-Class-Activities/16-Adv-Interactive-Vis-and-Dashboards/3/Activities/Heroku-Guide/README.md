## Heroku Deployment Guide

 Heroku is a cloud application platform. This means that we can run our scripts on Heroku's servers! Here are the steps to do get our apps running on Heroku.

 **You can follow the steps in this guide. They all apply to the activity in the [1/01-Evr_Heroku_Deployment](../1/01-Evr_Heroku_Deployment) folder.**

* Important: before deploying your code to a cloud server, verify that it runs without error locally (i.e. be able to run it from your console or in Jupyter Notebook without errors).
* _If your local file connects to an API or uses other configuration variables, you may need to have a code that you will comment out when testing locally as well as code to comment out when deploying._

For example:
```
# Import your config file(s) and variable(s)

# Heroku check
is_heroku = False
if 'IS_HEROKU' in os.environ:
    is_heroku = True

if is_heroku == False:
    from config import remote_dbendpoint, remote_dbport, remote_dbname, remote_dbuser, remote_dbpwd
else:
    remote_dbendpoint = os.environ.get('remote_dbendpoint')
    remote_dbport = os.environ.get('remote_dbport')
    remote_dbname = os.environ.get('remote_dbname')
    remote_dbuser = os.environ.get('remote_dbuser')
    remote_dbpwd = os.environ.get('remote_dbpwd')
```

* **Prerequisite Work**
  * 1. Install Heroku Common Line Interface
      * https://devcenter.heroku.com/articles/getting-started-with-python#set-up
* **Python**
  * 2. If your Python script was created in Jupyter Notebook, export it from `.ipynb` to `.py`
* **GitHub**
  * 3. Create a repo for your Heroku app on GitHub
  * 4. Clone the repo to your local machine
  * 5. Add the python script, `requirements.txt`, and `Procfile` to your local repo
  * 6. Push your code to Github. Include the python script, as well as the `Procfile` and `requirements.txt` files in the directory
* **Heroku Account**
  * 7. Create a Heroku account
    * https://www.heroku.com
* **Configure Heroku App**
  * 8. Create a Heroku app
  * 9. Configure your Heroku app
    * Configure environment variables
      * For example, Twitter API keys, Weather API keys, Other API keys
      * Set up the Timezone (TZ) for your app
        * https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
      * Please also configure the `IS_HEROKU` environment variable. Set the value to `True`. You can use this to control whether your script will use the config file or Heroku environment variables.
* **Deploy Heroku App**
  * 10. Connect to Git Repository (on the _Deploy_ tab in Heroku)
  * 11. Confirm deployment status (on the _Activity_ tab in Heroku)
  * 12. Enable "worker" (on the _Resources_ tab in Heroku)
* **Confirm Functionality**
  * 13. View logs
      * https://devcenter.heroku.com/articles/logging#view-logs
      * From Anaconda Prompt or the terminal, type `heroku logs --app the-name-of-your-app` (replace `the-name-of-your-app` with your app name)
  * 14. For more reference, review
    * https://devcenter.heroku.com/articles/getting-started-with-python


## Helpful Information

#### Configuration (Profile, Requirements.txt, Python Script)

* Your `Procfile` should contain the name of the Python script that you want to run as part of the worker. For example, if your Python file was called `ChatterBot.py`, then you would have a line in your `Profile` that read either:

  * `worker: python Weather_Tweets-Heroku.py` for Python scripts that do not have a web component or 
  * `web: gunicorn app:app` for Python applications that *do have* a web component (such as Project 2 and the Final Project)

  ![procfile](Images/procfile.png)

* Your `requirements.txt` should list the required modules, and their versions. For example, the `tweepy` module, version `3.5.0` (yours may be different). You can run `conda list` from your console to display all the modules you have installed, as well as their version numbers.

  ![requirements](Images/requirements.png)

* On Heroku, your Python script `______.py` retrieves the api keys through environment variables instead of through `config.py`. These variables will need to be manually added to Heroku under the application settings tab. Python is simply reading the environment variables into the script.

  ```python
  consumer_key = os.environ.get("consumer_key")
  consumer_secret = os.environ.get("consumer_secret")
  access_token = os.environ.get("access_token")
  access_token_secret = os.environ.get("access_token_secret")
  ```

* Follow these steps to manually set the environment variables:

  ![config variable](Images/config_var.png)

  1. Go to the project page on Heroku and navigate to the Settings tab.
  2. Find the option for **Config Vars**.
  3. Click `Reveal Config Vars`.
  4. Manually enter the Twitter API keys.

* Entering the API keys in Heroku will allow the script to access the keys without exposing the keys through Github.

#### Creating a Heroku Account

* Go to [http://www.heroku.com](heroku.com) and create an account.

* After registering, click on `New`, then on `Create new app`. You will create a new `app` for each program.

  ![heroku1.png](Images/heroku1.png)

* In the next screen, create your `App name`, a unique and meaningful name for your app. Click on `Create app`.

  ![heroku2.png](Images/heroku2.png)

* Next, select `Connect to Github`, and click the button at the bottom.

  ![heroku3.png](Images/heroku3.png)

* In the field `repo-name`, enter the name of your Github repo, and click `Search`.

  ![heroku4.png](Images/heroku4.png)

* Click `Connect` to link your Heroku app with your Github repo.

  ![heroku5.png](Images/heroku5.png)  

* Click on `Enable Automatic Deploys`, which will allow the Heroku server to restart your app whenever you push a change to your Github repo.

  ![heroku6.png](Images/heroku6.png)  

* Finally, click on the `Resources` tab, followed by clicking the `edit` button with the pencil icon.

  ![heroku7.png](Images/heroku7.png)

* Slide the worker switch to the right, then click on `Confirm`.

  ![heroku8.png](Images/heroku8.png)  

* Your app should now be deployed!  
