```python
%matplotlib notebook
```


```python
# Dependencies
import tweepy
import json
import pandas as pd
import os
```


```python
from config import consumer_key, consumer_secret, access_token, access_token_secret
```


```python
# Setup Tweepy API Authentication
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
# api = tweepy.API(auth, parser=tweepy.parsers.JSONParser())
api = tweepy.API(auth)
```


```python
# Target User Account
user_account = "MayorBowser"
```


```python
tweets = []

tweet_id = []
created_at = []
favorite_count = []
full_text = []
entities = []
```


```python
# Iterate through the first 500 tweets
for tweet in tweepy.Cursor(api.user_timeline, 'MayorBowser', tweet_mode='extended').items(500):
    tweets.append(tweet)
```


```python
# Preview the tweets list
tweets[0]._json
```




    {'created_at': 'Wed Nov 11 02:00:16 +0000 2020',
     'id': 1326343959627624448,
     'id_str': '1326343959627624448',
     'full_text': 'In observance of Veterans Day, public testing sites for COVID-19 will be closed tomorrow. To get a test, please call your doctor. Stay home if you are experiencing symptoms.',
     'truncated': False,
     'display_text_range': [0, 173],
     'entities': {'hashtags': [], 'symbols': [], 'user_mentions': [], 'urls': []},
     'source': '<a href="https://sproutsocial.com" rel="nofollow">Sprout Social</a>',
     'in_reply_to_status_id': None,
     'in_reply_to_status_id_str': None,
     'in_reply_to_user_id': None,
     'in_reply_to_user_id_str': None,
     'in_reply_to_screen_name': None,
     'user': {'id': 976542720,
      'id_str': '976542720',
      'name': 'Mayor Muriel Bowser',
      'screen_name': 'MayorBowser',
      'location': 'Washington, DC',
      'description': "Official account of the Mayor of Washington, DC. Together, we're working to give every Washingtonian a #FairShot. Tweets from Mayor Bowser signed MMB.",
      'url': 'https://t.co/QM493dPOC5',
      'entities': {'url': {'urls': [{'url': 'https://t.co/QM493dPOC5',
          'expanded_url': 'http://coronavirus.dc.gov',
          'display_url': 'coronavirus.dc.gov',
          'indices': [0, 23]}]},
       'description': {'urls': []}},
      'protected': False,
      'followers_count': 182914,
      'friends_count': 710,
      'listed_count': 1433,
      'created_at': 'Wed Nov 28 17:09:57 +0000 2012',
      'favourites_count': 10206,
      'utc_offset': None,
      'time_zone': None,
      'geo_enabled': True,
      'verified': True,
      'statuses_count': 17260,
      'lang': None,
      'contributors_enabled': False,
      'is_translator': False,
      'is_translation_enabled': True,
      'profile_background_color': 'C0DEED',
      'profile_background_image_url': 'http://abs.twimg.com/images/themes/theme1/bg.png',
      'profile_background_image_url_https': 'https://abs.twimg.com/images/themes/theme1/bg.png',
      'profile_background_tile': True,
      'profile_image_url': 'http://pbs.twimg.com/profile_images/836800390851149825/ihtkKO60_normal.jpg',
      'profile_image_url_https': 'https://pbs.twimg.com/profile_images/836800390851149825/ihtkKO60_normal.jpg',
      'profile_banner_url': 'https://pbs.twimg.com/profile_banners/976542720/1583960994',
      'profile_link_color': '19CF86',
      'profile_sidebar_border_color': 'FFFFFF',
      'profile_sidebar_fill_color': 'DDEEF6',
      'profile_text_color': '333333',
      'profile_use_background_image': True,
      'has_extended_profile': False,
      'default_profile': False,
      'default_profile_image': False,
      'following': False,
      'follow_request_sent': False,
      'notifications': False,
      'translator_type': 'none'},
     'geo': None,
     'coordinates': None,
     'place': None,
     'contributors': None,
     'is_quote_status': False,
     'retweet_count': 11,
     'favorite_count': 41,
     'favorited': False,
     'retweeted': False,
     'lang': 'en'}




```python
# Loop through Tweets list and process data 
for t in tweets:
    tweet_id.append(t.id)
    created_at.append(t.created_at)
    favorite_count.append(t.favorite_count)
    full_text.append(t.full_text)
    entities.append(t.entities)
```


```python
# Build a tweets DataFrame

tweets_df = pd.DataFrame({
    'Tweet ID': tweet_id,
    'Tweet Time': created_at,
    'Favorite Count': favorite_count,
    'Tweet Text': full_text    
    })
```


```python
len(tweets_df)
```




    500




```python
# set DataFrame to not truncate
pd.set_option('display.max_colwidth', -1)
pd.set_option('display.max_columns', None)
```


```python
tweets_df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Tweet ID</th>
      <th>Tweet Time</th>
      <th>Favorite Count</th>
      <th>Tweet Text</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>0</td>
      <td>1326343959627624448</td>
      <td>2020-11-11 02:00:16</td>
      <td>41</td>
      <td>In observance of Veterans Day, public testing sites for COVID-19 will be closed tomorrow. To get a test, please call your doctor. Stay home if you are experiencing symptoms.</td>
    </tr>
    <tr>
      <td>1</td>
      <td>1326268635048890368</td>
      <td>2020-11-10 21:00:58</td>
      <td>10</td>
      <td>LIVE: District Economic Recovery Check-In https://t.co/1XKztZ01LS</td>
    </tr>
    <tr>
      <td>2</td>
      <td>1326238308138160128</td>
      <td>2020-11-10 19:00:27</td>
      <td>19</td>
      <td>The DC Mayor’s Office of Veterans Affairs serves the District’s 30,000 veterans and their families. If you're a Veteran in need of help, watch the video below to learn more about their services and call (202) 724-5454.\n\nhttps://t.co/6WZWuf1KX5</td>
    </tr>
    <tr>
      <td>3</td>
      <td>1326212089220919302</td>
      <td>2020-11-10 17:16:16</td>
      <td>21</td>
      <td>Today’s COVID-19 public testing sites graphic has been updated. Open sites for Tuesday, November 10 below. https://t.co/LpiZ15691c</td>
    </tr>
    <tr>
      <td>4</td>
      <td>1326208158176571392</td>
      <td>2020-11-10 17:00:39</td>
      <td>14</td>
      <td>Looking ahead to Veterans Day? Service adjustments for District services may impact your plans.\n\nTo learn what's open and what's closed visit: https://t.co/npa3Vcz5W0 https://t.co/eqE7NzWk0b</td>
    </tr>
  </tbody>
</table>
</div>




```python
tweets_df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Tweet ID</th>
      <th>Tweet Time</th>
      <th>Favorite Count</th>
      <th>Tweet Text</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>0</td>
      <td>1326343959627624448</td>
      <td>2020-11-11 02:00:16</td>
      <td>41</td>
      <td>In observance of Veterans Day, public testing sites for COVID-19 will be closed tomorrow. To get a test, please call your doctor. Stay home if you are experiencing symptoms.</td>
    </tr>
    <tr>
      <td>1</td>
      <td>1326268635048890368</td>
      <td>2020-11-10 21:00:58</td>
      <td>10</td>
      <td>LIVE: District Economic Recovery Check-In https://t.co/1XKztZ01LS</td>
    </tr>
    <tr>
      <td>2</td>
      <td>1326238308138160128</td>
      <td>2020-11-10 19:00:27</td>
      <td>19</td>
      <td>The DC Mayor’s Office of Veterans Affairs serves the District’s 30,000 veterans and their families. If you're a Veteran in need of help, watch the video below to learn more about their services and call (202) 724-5454.\n\nhttps://t.co/6WZWuf1KX5</td>
    </tr>
    <tr>
      <td>3</td>
      <td>1326212089220919302</td>
      <td>2020-11-10 17:16:16</td>
      <td>21</td>
      <td>Today’s COVID-19 public testing sites graphic has been updated. Open sites for Tuesday, November 10 below. https://t.co/LpiZ15691c</td>
    </tr>
    <tr>
      <td>4</td>
      <td>1326208158176571392</td>
      <td>2020-11-10 17:00:39</td>
      <td>14</td>
      <td>Looking ahead to Veterans Day? Service adjustments for District services may impact your plans.\n\nTo learn what's open and what's closed visit: https://t.co/npa3Vcz5W0 https://t.co/eqE7NzWk0b</td>
    </tr>
    <tr>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <td>495</td>
      <td>1306404624413401094</td>
      <td>2020-09-17 01:28:28</td>
      <td>0</td>
      <td>@theroostdc @buzzbakeshop @ShopMadeInDC Welcome to DC! Thank you for supporting #MadeInDC.</td>
    </tr>
    <tr>
      <td>496</td>
      <td>1306403976133382155</td>
      <td>2020-09-17 01:25:54</td>
      <td>3</td>
      <td>@levainbakery Welcome to DC! 👏🏽</td>
    </tr>
    <tr>
      <td>497</td>
      <td>1306390389184696320</td>
      <td>2020-09-17 00:31:54</td>
      <td>201</td>
      <td>Seven years ago today, the Navy Yard shooting claimed 12 lives and injured three others. Let's remember them today, their families, the victims, and the pain our community experienced because of senseless gun violence. We must never forget.</td>
    </tr>
    <tr>
      <td>498</td>
      <td>1306352572819800066</td>
      <td>2020-09-16 22:01:38</td>
      <td>69</td>
      <td>Meet the first Solar For All Community Renewable Energy Facility (CREF) to come to Ward 8! It will provide over 750 residents with up to $500 in annual electricity bill savings.\n\nLearn more: https://t.co/PSMvRg0frs https://t.co/CunrTukNoI</td>
    </tr>
    <tr>
      <td>499</td>
      <td>1306337467109224448</td>
      <td>2020-09-16 21:01:37</td>
      <td>17</td>
      <td>LIVE: Community call on coronavirus (COVID-19). https://t.co/UopkHhDyXh</td>
    </tr>
  </tbody>
</table>
<p>500 rows × 4 columns</p>
</div>




```python
#tweets_df.to_excel('bowser_tweets.xlsx')
#entities
```


```python
hashtag_entries = [e['hashtags'] for e in entities]
hashtag_entries
```




    [[],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'DMVbrw', 'indices': [238, 245]}],
     [{'text': '36000by2025', 'indices': [239, 251]}],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'DMVbrw', 'indices': [135, 142]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'FairShot', 'indices': [144, 153]},
      {'text': '36000by2025', 'indices': [157, 169]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'español', 'indices': [86, 94]},
      {'text': 'ReopenStrong', 'indices': [96, 109]}],
     [{'text': 'ReopenStrong', 'indices': [11, 24]}],
     [{'text': 'DCsBravest', 'indices': [72, 83]},
      {'text': 'SaferStrongerDC', 'indices': [185, 201]}],
     [],
     [],
     [],
     [{'text': 'VOTE', 'indices': [118, 123]}],
     [{'text': 'VOTE', 'indices': [15, 20]}],
     [{'text': 'Vote', 'indices': [26, 31]}],
     [{'text': 'VOTE', 'indices': [26, 31]}],
     [{'text': 'VOTE', 'indices': [51, 56]}],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'VOTE', 'indices': [56, 61]}],
     [{'text': 'ReopenStrong', 'indices': [38, 51]}],
     [{'text': 'ReopenStrong', 'indices': [36, 49]}],
     [{'text': 'ReopenStrong', 'indices': [36, 49]}],
     [{'text': 'ReopenStrong', 'indices': [37, 50]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [37, 50]}],
     [{'text': 'ReopenStrong', 'indices': [39, 52]}],
     [{'text': 'ReopenStrong', 'indices': [38, 51]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [33, 46]}],
     [{'text': 'ReopenStrong', 'indices': [37, 50]}],
     [{'text': 'ReopenStrong', 'indices': [39, 52]}],
     [{'text': 'ReopenStrong', 'indices': [32, 45]}],
     [{'text': 'ReopenStrong', 'indices': [36, 49]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [38, 51]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [32, 45]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [38, 51]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [32, 45]}],
     [{'text': 'ReopenStrong', 'indices': [38, 51]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [37, 50]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [36, 49]}],
     [{'text': 'ReopenStrong', 'indices': [31, 44]}],
     [{'text': 'ReopenStrong', 'indices': [33, 46]}],
     [{'text': 'ReopenStrong', 'indices': [37, 50]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [32, 45]}],
     [{'text': 'ReopenStrong', 'indices': [37, 50]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [39, 52]}],
     [{'text': 'ReopenStrong', 'indices': [39, 52]}],
     [{'text': 'ReopenStrong', 'indices': [39, 52]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [36, 49]}],
     [{'text': 'ReopenStrong', 'indices': [36, 49]}],
     [{'text': 'ReopenStrong', 'indices': [32, 45]}],
     [{'text': 'ReopenStrong', 'indices': [33, 46]}],
     [{'text': 'ReopenStrong', 'indices': [32, 45]}],
     [{'text': 'ReopenStrong', 'indices': [30, 43]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [33, 46]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [36, 49]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [36, 49]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [37, 50]}],
     [{'text': 'ReopenStrong', 'indices': [36, 49]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [32, 45]}],
     [{'text': 'ReopenStrong', 'indices': [33, 46]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [38, 51]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [32, 45]}],
     [{'text': 'ReopenStrong', 'indices': [38, 51]}],
     [{'text': 'ReopenStrong', 'indices': [36, 49]}],
     [{'text': 'ReopenStrong', 'indices': [30, 43]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [42, 55]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [37, 50]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [32, 45]}],
     [{'text': 'ReopenStrong', 'indices': [38, 51]}],
     [{'text': 'ReopenStrong', 'indices': [39, 52]}],
     [{'text': 'ReopenStrong', 'indices': [32, 45]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [33, 46]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [31, 44]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'WinterReadyDC', 'indices': [257, 271]}],
     [],
     [],
     [],
     [],
     [{'text': 'MaskUpDC', 'indices': [126, 135]}],
     [],
     [],
     [],
     [],
     [{'text': 'DCStatehood', 'indices': [109, 121]}],
     [],
     [{'text': 'MaskUpDC', 'indices': [149, 158]}],
     [{'text': 'MaskUpDC', 'indices': [184, 193]}],
     [],
     [],
     [{'text': 'MaskUpDC', 'indices': [58, 67]}],
     [],
     [],
     [],
     [],
     [{'text': 'Zeta', 'indices': [134, 139]}],
     [],
     [],
     [],
     [],
     [{'text': 'ReopenStrong', 'indices': [11, 24]}],
     [],
     [{'text': 'ReopenStrong', 'indices': [14, 27]}],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'DCsBravest', 'indices': [72, 83]},
      {'text': 'SaferStrongerDC', 'indices': [185, 201]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'SustainableDC', 'indices': [0, 14]}],
     [{'text': 'DaveChappelleDay', 'indices': [5, 22]}],
     [],
     [],
     [],
     [],
     [{'text': 'MaskUpDC', 'indices': [188, 197]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'DCProud', 'indices': [0, 8]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'BreastCancerAwarenessMonth', 'indices': [245, 272]}],
     [],
     [],
     [{'text': 'JumpinDC', 'indices': [23, 32]}],
     [],
     [{'text': 'DCsBravest', 'indices': [19, 30]}],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'DonnieMemory', 'indices': [120, 133]}],
     [{'text': 'DonnieMemory', 'indices': [62, 75]}],
     [],
     [],
     [],
     [{'text': 'ReopenStrong', 'indices': [11, 24]}],
     [],
     [{'text': 'ReopenStrong', 'indices': [14, 27]}],
     [{'text': 'HowDoYouMoveDC', 'indices': [12, 27]},
      {'text': 'TakeTheSurvey', 'indices': [98, 112]}],
     [],
     [],
     [{'text': 'BreastCancerAwarenessMonth', 'indices': [245, 272]}],
     [],
     [],
     [],
     [],
     [{'text': 'ReopenStrong', 'indices': [41, 54]}],
     [{'text': 'MaskUpDC', 'indices': [136, 145]}],
     [{'text': 'FamiliesFirstDC', 'indices': [218, 234]}],
     [],
     [],
     [{'text': 'coronavirus', 'indices': [55, 67]}],
     [],
     [],
     [],
     [],
     [{'text': 'ReopenStrong', 'indices': [267, 280]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'DCHOPE', 'indices': [245, 252]}],
     [{'text': 'MaskUpDC', 'indices': [88, 97]}],
     [],
     [],
     [{'text': 'BlackPoetryDay', 'indices': [163, 178]}],
     [],
     [{'text': 'DCsBravest', 'indices': [76, 87]}],
     [],
     [],
     [{'text': 'MillionManMarch', 'indices': [31, 47]}],
     [{'text': 'DCHOPE', 'indices': [245, 252]}],
     [],
     [],
     [{'text': 'MuralsDC', 'indices': [178, 187]}],
     [],
     [{'text': '36000by2025', 'indices': [210, 222]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'ReopenStrong', 'indices': [6, 19]}],
     [{'text': 'MaskUpDC', 'indices': [91, 100]}],
     [],
     [],
     [],
     [],
     [{'text': 'JumpinDC', 'indices': [23, 32]}],
     [],
     [{'text': 'ReopenStrong', 'indices': [69, 82]}],
     [{'text': 'DCHOPE', 'indices': [243, 250]}],
     [],
     [{'text': 'DCHOPE', 'indices': [245, 252]}],
     [],
     [],
     [{'text': 'DCHOPE', 'indices': [273, 280]}],
     [{'text': '2020Census', 'indices': [55, 66]},
      {'text': 'GetCountedDC', 'indices': [242, 255]}],
     [{'text': 'DomesticViolenceAwarenessMonth', 'indices': [100, 131]}],
     [],
     [],
     [{'text': 'JumpinDC', 'indices': [11, 20]}],
     [{'text': 'FamiliesFirstDC', 'indices': [218, 234]}],
     [],
     [],
     [{'text': 'FamiliesFirstDC', 'indices': [218, 234]}],
     [{'text': 'IndigenousPeoplesDay', 'indices': [3, 24]}],
     [],
     [{'text': 'HispanicHeritageMonth', 'indices': [46, 68]}],
     [{'text': 'DCStatehood', 'indices': [96, 108]}],
     [],
     [{'text': 'MaskUpDC', 'indices': [63, 72]}],
     [{'text': 'DCproud', 'indices': [0, 8]},
      {'text': 'NationalComingOutDay', 'indices': [215, 236]}],
     [{'text': 'DayOfTheGirl', 'indices': [49, 62]}],
     [],
     [],
     [{'text': 'LGBTQ', 'indices': [28, 34]},
      {'text': 'ILearnAmerica', 'indices': [53, 67]}],
     [],
     [],
     [{'text': 'WorldMentalHealthDay', 'indices': [88, 109]}],
     [],
     [{'text': 'BLACKSinWAX', 'indices': [11, 23]}],
     [{'text': 'HispanicHeritageMonthDC', 'indices': [47, 71]}],
     [{'text': 'DCStatehood', 'indices': [114, 126]}],
     [{'text': 'MaskUpDC', 'indices': [137, 146]}],
     [],
     [],
     [{'text': 'smallbiz', 'indices': [25, 34]}],
     [{'text': 'HispanicHeritageMonthDC', 'indices': [50, 74]}],
     [{'text': 'HomewardDC', 'indices': [234, 245]}],
     [],
     [],
     [],
     [{'text': 'FamiliesFirstDC', 'indices': [218, 234]}],
     [],
     [],
     [],
     [{'text': 'FamiliesFirstDC', 'indices': [244, 260]}],
     [],
     [{'text': 'MoveDC', 'indices': [148, 155]}],
     [{'text': 'NationalNightOut', 'indices': [84, 101]}],
     [],
     [],
     [{'text': 'BreastCancerAwarenessMonth', 'indices': [253, 280]}],
     [{'text': 'ReopenStrong', 'indices': [72, 85]}],
     [{'text': 'DCHOPE', 'indices': [232, 239]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': '2020Census', 'indices': [55, 66]},
      {'text': 'GetCountedDC', 'indices': [234, 247]}],
     [],
     [],
     [],
     [{'text': 'WorldTeachersDay', 'indices': [247, 264]}],
     [],
     [],
     [{'text': 'HispanicHeritageMonth', 'indices': [46, 68]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'DomesticViolenceAwarenessMonth', 'indices': [133, 164]}],
     [],
     [{'text': 'DCHOPE', 'indices': [125, 132]}],
     [{'text': 'PrincipalAppreciationMonth', 'indices': [84, 111]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'DontWaitVaccinate', 'indices': [185, 203]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'HispanicHeritageMonthDC', 'indices': [38, 62]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'FITDC', 'indices': [6, 12]}],
     [],
     [],
     [{'text': '202Creates', 'indices': [55, 66]}],
     [{'text': 'YomKippur', 'indices': [68, 78]}],
     [{'text': 'DCStatehood', 'indices': [22, 34]},
      {'text': 'GetCountedDC', 'indices': [217, 230]}],
     [{'text': 'AfricanHeritageMonth', 'indices': [50, 71]}],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'HispanicHeritageMonthDC', 'indices': [50, 74]}],
     [],
     [],
     [{'text': 'DCHOPE', 'indices': [101, 108]},
      {'text': 'MLKreimagined', 'indices': [110, 124]}],
     [{'text': 'MaskUpDC', 'indices': [69, 78]},
      {'text': 'DCHOPE', 'indices': [79, 86]}],
     [],
     [],
     [{'text': 'MLKreimagined', 'indices': [101, 115]}],
     [{'text': 'DCValues', 'indices': [79, 88]}],
     [],
     [],
     [{'text': '202Creates', 'indices': [191, 202]}],
     [],
     [],
     [],
     [{'text': 'DCRetail', 'indices': [39, 48]}],
     [],
     [],
     [{'text': 'DontWaitVaccinate', 'indices': [185, 203]}],
     [{'text': 'AfricanHeritageMonth', 'indices': [71, 92]}],
     [],
     [],
     [{'text': 'NationalVoterRegistrationDay', 'indices': [4, 33]}],
     [],
     [],
     [],
     [{'text': 'AgeFriendlyDC', 'indices': [43, 57]}],
     [{'text': 'NationalVoterRegistrationDay', 'indices': [201, 230]}],
     [],
     [],
     [],
     [{'text': 'WearAMask', 'indices': [87, 97]}],
     [],
     [{'text': 'GetCountedDC', 'indices': [94, 107]}],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'DCStatehood', 'indices': [97, 109]}],
     [{'text': 'FITDC', 'indices': [6, 12]}],
     [],
     [],
     [{'text': 'SustainableDC', 'indices': [248, 262]}],
     [{'text': 'RAMMYS20', 'indices': [0, 9]}],
     [{'text': '2020Census', 'indices': [53, 64]},
      {'text': 'GetCountedDC', 'indices': [237, 250]}],
     [],
     [{'text': 'DCValues', 'indices': [0, 9]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'HIVAwarenessDay', 'indices': [179, 195]}],
     [],
     [{'text': 'RoshHashanah', 'indices': [102, 115]}],
     [],
     [{'text': 'DCMaternalHealth', 'indices': [63, 80]}],
     [],
     [],
     [],
     [{'text': 'Ward4', 'indices': [29, 35]}],
     [],
     [],
     [{'text': 'DCMaternalHealth', 'indices': [63, 80]}],
     [{'text': '202Creates', 'indices': [205, 216]}],
     [{'text': 'CitizenshipDay', 'indices': [6, 21]}],
     [],
     [{'text': 'MadeInDC', 'indices': [80, 89]}],
     [],
     [],
     [],
     []]




```python
hashtags = []

for h in hashtag_entries:
    for t in h:
        hashtags.append(t['text'])
        
hashtags
```




    ['DMVbrw',
     '36000by2025',
     'DMVbrw',
     'FairShot',
     '36000by2025',
     'español',
     'ReopenStrong',
     'ReopenStrong',
     'DCsBravest',
     'SaferStrongerDC',
     'VOTE',
     'VOTE',
     'Vote',
     'VOTE',
     'VOTE',
     'VOTE',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'ReopenStrong',
     'WinterReadyDC',
     'MaskUpDC',
     'DCStatehood',
     'MaskUpDC',
     'MaskUpDC',
     'MaskUpDC',
     'Zeta',
     'ReopenStrong',
     'ReopenStrong',
     'DCsBravest',
     'SaferStrongerDC',
     'SustainableDC',
     'DaveChappelleDay',
     'MaskUpDC',
     'DCProud',
     'BreastCancerAwarenessMonth',
     'JumpinDC',
     'DCsBravest',
     'DonnieMemory',
     'DonnieMemory',
     'ReopenStrong',
     'ReopenStrong',
     'HowDoYouMoveDC',
     'TakeTheSurvey',
     'BreastCancerAwarenessMonth',
     'ReopenStrong',
     'MaskUpDC',
     'FamiliesFirstDC',
     'coronavirus',
     'ReopenStrong',
     'DCHOPE',
     'MaskUpDC',
     'BlackPoetryDay',
     'DCsBravest',
     'MillionManMarch',
     'DCHOPE',
     'MuralsDC',
     '36000by2025',
     'ReopenStrong',
     'MaskUpDC',
     'JumpinDC',
     'ReopenStrong',
     'DCHOPE',
     'DCHOPE',
     'DCHOPE',
     '2020Census',
     'GetCountedDC',
     'DomesticViolenceAwarenessMonth',
     'JumpinDC',
     'FamiliesFirstDC',
     'FamiliesFirstDC',
     'IndigenousPeoplesDay',
     'HispanicHeritageMonth',
     'DCStatehood',
     'MaskUpDC',
     'DCproud',
     'NationalComingOutDay',
     'DayOfTheGirl',
     'LGBTQ',
     'ILearnAmerica',
     'WorldMentalHealthDay',
     'BLACKSinWAX',
     'HispanicHeritageMonthDC',
     'DCStatehood',
     'MaskUpDC',
     'smallbiz',
     'HispanicHeritageMonthDC',
     'HomewardDC',
     'FamiliesFirstDC',
     'FamiliesFirstDC',
     'MoveDC',
     'NationalNightOut',
     'BreastCancerAwarenessMonth',
     'ReopenStrong',
     'DCHOPE',
     '2020Census',
     'GetCountedDC',
     'WorldTeachersDay',
     'HispanicHeritageMonth',
     'DomesticViolenceAwarenessMonth',
     'DCHOPE',
     'PrincipalAppreciationMonth',
     'DontWaitVaccinate',
     'HispanicHeritageMonthDC',
     'FITDC',
     '202Creates',
     'YomKippur',
     'DCStatehood',
     'GetCountedDC',
     'AfricanHeritageMonth',
     'HispanicHeritageMonthDC',
     'DCHOPE',
     'MLKreimagined',
     'MaskUpDC',
     'DCHOPE',
     'MLKreimagined',
     'DCValues',
     '202Creates',
     'DCRetail',
     'DontWaitVaccinate',
     'AfricanHeritageMonth',
     'NationalVoterRegistrationDay',
     'AgeFriendlyDC',
     'NationalVoterRegistrationDay',
     'WearAMask',
     'GetCountedDC',
     'DCStatehood',
     'FITDC',
     'SustainableDC',
     'RAMMYS20',
     '2020Census',
     'GetCountedDC',
     'DCValues',
     'HIVAwarenessDay',
     'RoshHashanah',
     'DCMaternalHealth',
     'Ward4',
     'DCMaternalHealth',
     '202Creates',
     'CitizenshipDay',
     'MadeInDC']




```python
hashtag_entries
```




    [[],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'DMVbrw', 'indices': [238, 245]}],
     [{'text': '36000by2025', 'indices': [239, 251]}],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'DMVbrw', 'indices': [135, 142]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'FairShot', 'indices': [144, 153]},
      {'text': '36000by2025', 'indices': [157, 169]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'español', 'indices': [86, 94]},
      {'text': 'ReopenStrong', 'indices': [96, 109]}],
     [{'text': 'ReopenStrong', 'indices': [11, 24]}],
     [{'text': 'DCsBravest', 'indices': [72, 83]},
      {'text': 'SaferStrongerDC', 'indices': [185, 201]}],
     [],
     [],
     [],
     [{'text': 'VOTE', 'indices': [118, 123]}],
     [{'text': 'VOTE', 'indices': [15, 20]}],
     [{'text': 'Vote', 'indices': [26, 31]}],
     [{'text': 'VOTE', 'indices': [26, 31]}],
     [{'text': 'VOTE', 'indices': [51, 56]}],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'VOTE', 'indices': [56, 61]}],
     [{'text': 'ReopenStrong', 'indices': [38, 51]}],
     [{'text': 'ReopenStrong', 'indices': [36, 49]}],
     [{'text': 'ReopenStrong', 'indices': [36, 49]}],
     [{'text': 'ReopenStrong', 'indices': [37, 50]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [37, 50]}],
     [{'text': 'ReopenStrong', 'indices': [39, 52]}],
     [{'text': 'ReopenStrong', 'indices': [38, 51]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [33, 46]}],
     [{'text': 'ReopenStrong', 'indices': [37, 50]}],
     [{'text': 'ReopenStrong', 'indices': [39, 52]}],
     [{'text': 'ReopenStrong', 'indices': [32, 45]}],
     [{'text': 'ReopenStrong', 'indices': [36, 49]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [38, 51]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [32, 45]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [38, 51]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [32, 45]}],
     [{'text': 'ReopenStrong', 'indices': [38, 51]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [37, 50]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [36, 49]}],
     [{'text': 'ReopenStrong', 'indices': [31, 44]}],
     [{'text': 'ReopenStrong', 'indices': [33, 46]}],
     [{'text': 'ReopenStrong', 'indices': [37, 50]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [32, 45]}],
     [{'text': 'ReopenStrong', 'indices': [37, 50]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [39, 52]}],
     [{'text': 'ReopenStrong', 'indices': [39, 52]}],
     [{'text': 'ReopenStrong', 'indices': [39, 52]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [36, 49]}],
     [{'text': 'ReopenStrong', 'indices': [36, 49]}],
     [{'text': 'ReopenStrong', 'indices': [32, 45]}],
     [{'text': 'ReopenStrong', 'indices': [33, 46]}],
     [{'text': 'ReopenStrong', 'indices': [32, 45]}],
     [{'text': 'ReopenStrong', 'indices': [30, 43]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [33, 46]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [36, 49]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [36, 49]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [37, 50]}],
     [{'text': 'ReopenStrong', 'indices': [36, 49]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [32, 45]}],
     [{'text': 'ReopenStrong', 'indices': [33, 46]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [38, 51]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [32, 45]}],
     [{'text': 'ReopenStrong', 'indices': [38, 51]}],
     [{'text': 'ReopenStrong', 'indices': [36, 49]}],
     [{'text': 'ReopenStrong', 'indices': [30, 43]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [42, 55]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [37, 50]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [32, 45]}],
     [{'text': 'ReopenStrong', 'indices': [38, 51]}],
     [{'text': 'ReopenStrong', 'indices': [39, 52]}],
     [{'text': 'ReopenStrong', 'indices': [32, 45]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [33, 46]}],
     [{'text': 'ReopenStrong', 'indices': [34, 47]}],
     [{'text': 'ReopenStrong', 'indices': [35, 48]}],
     [{'text': 'ReopenStrong', 'indices': [31, 44]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'WinterReadyDC', 'indices': [257, 271]}],
     [],
     [],
     [],
     [],
     [{'text': 'MaskUpDC', 'indices': [126, 135]}],
     [],
     [],
     [],
     [],
     [{'text': 'DCStatehood', 'indices': [109, 121]}],
     [],
     [{'text': 'MaskUpDC', 'indices': [149, 158]}],
     [{'text': 'MaskUpDC', 'indices': [184, 193]}],
     [],
     [],
     [{'text': 'MaskUpDC', 'indices': [58, 67]}],
     [],
     [],
     [],
     [],
     [{'text': 'Zeta', 'indices': [134, 139]}],
     [],
     [],
     [],
     [],
     [{'text': 'ReopenStrong', 'indices': [11, 24]}],
     [],
     [{'text': 'ReopenStrong', 'indices': [14, 27]}],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'DCsBravest', 'indices': [72, 83]},
      {'text': 'SaferStrongerDC', 'indices': [185, 201]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'SustainableDC', 'indices': [0, 14]}],
     [{'text': 'DaveChappelleDay', 'indices': [5, 22]}],
     [],
     [],
     [],
     [],
     [{'text': 'MaskUpDC', 'indices': [188, 197]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'DCProud', 'indices': [0, 8]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'BreastCancerAwarenessMonth', 'indices': [245, 272]}],
     [],
     [],
     [{'text': 'JumpinDC', 'indices': [23, 32]}],
     [],
     [{'text': 'DCsBravest', 'indices': [19, 30]}],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'DonnieMemory', 'indices': [120, 133]}],
     [{'text': 'DonnieMemory', 'indices': [62, 75]}],
     [],
     [],
     [],
     [{'text': 'ReopenStrong', 'indices': [11, 24]}],
     [],
     [{'text': 'ReopenStrong', 'indices': [14, 27]}],
     [{'text': 'HowDoYouMoveDC', 'indices': [12, 27]},
      {'text': 'TakeTheSurvey', 'indices': [98, 112]}],
     [],
     [],
     [{'text': 'BreastCancerAwarenessMonth', 'indices': [245, 272]}],
     [],
     [],
     [],
     [],
     [{'text': 'ReopenStrong', 'indices': [41, 54]}],
     [{'text': 'MaskUpDC', 'indices': [136, 145]}],
     [{'text': 'FamiliesFirstDC', 'indices': [218, 234]}],
     [],
     [],
     [{'text': 'coronavirus', 'indices': [55, 67]}],
     [],
     [],
     [],
     [],
     [{'text': 'ReopenStrong', 'indices': [267, 280]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'DCHOPE', 'indices': [245, 252]}],
     [{'text': 'MaskUpDC', 'indices': [88, 97]}],
     [],
     [],
     [{'text': 'BlackPoetryDay', 'indices': [163, 178]}],
     [],
     [{'text': 'DCsBravest', 'indices': [76, 87]}],
     [],
     [],
     [{'text': 'MillionManMarch', 'indices': [31, 47]}],
     [{'text': 'DCHOPE', 'indices': [245, 252]}],
     [],
     [],
     [{'text': 'MuralsDC', 'indices': [178, 187]}],
     [],
     [{'text': '36000by2025', 'indices': [210, 222]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'ReopenStrong', 'indices': [6, 19]}],
     [{'text': 'MaskUpDC', 'indices': [91, 100]}],
     [],
     [],
     [],
     [],
     [{'text': 'JumpinDC', 'indices': [23, 32]}],
     [],
     [{'text': 'ReopenStrong', 'indices': [69, 82]}],
     [{'text': 'DCHOPE', 'indices': [243, 250]}],
     [],
     [{'text': 'DCHOPE', 'indices': [245, 252]}],
     [],
     [],
     [{'text': 'DCHOPE', 'indices': [273, 280]}],
     [{'text': '2020Census', 'indices': [55, 66]},
      {'text': 'GetCountedDC', 'indices': [242, 255]}],
     [{'text': 'DomesticViolenceAwarenessMonth', 'indices': [100, 131]}],
     [],
     [],
     [{'text': 'JumpinDC', 'indices': [11, 20]}],
     [{'text': 'FamiliesFirstDC', 'indices': [218, 234]}],
     [],
     [],
     [{'text': 'FamiliesFirstDC', 'indices': [218, 234]}],
     [{'text': 'IndigenousPeoplesDay', 'indices': [3, 24]}],
     [],
     [{'text': 'HispanicHeritageMonth', 'indices': [46, 68]}],
     [{'text': 'DCStatehood', 'indices': [96, 108]}],
     [],
     [{'text': 'MaskUpDC', 'indices': [63, 72]}],
     [{'text': 'DCproud', 'indices': [0, 8]},
      {'text': 'NationalComingOutDay', 'indices': [215, 236]}],
     [{'text': 'DayOfTheGirl', 'indices': [49, 62]}],
     [],
     [],
     [{'text': 'LGBTQ', 'indices': [28, 34]},
      {'text': 'ILearnAmerica', 'indices': [53, 67]}],
     [],
     [],
     [{'text': 'WorldMentalHealthDay', 'indices': [88, 109]}],
     [],
     [{'text': 'BLACKSinWAX', 'indices': [11, 23]}],
     [{'text': 'HispanicHeritageMonthDC', 'indices': [47, 71]}],
     [{'text': 'DCStatehood', 'indices': [114, 126]}],
     [{'text': 'MaskUpDC', 'indices': [137, 146]}],
     [],
     [],
     [{'text': 'smallbiz', 'indices': [25, 34]}],
     [{'text': 'HispanicHeritageMonthDC', 'indices': [50, 74]}],
     [{'text': 'HomewardDC', 'indices': [234, 245]}],
     [],
     [],
     [],
     [{'text': 'FamiliesFirstDC', 'indices': [218, 234]}],
     [],
     [],
     [],
     [{'text': 'FamiliesFirstDC', 'indices': [244, 260]}],
     [],
     [{'text': 'MoveDC', 'indices': [148, 155]}],
     [{'text': 'NationalNightOut', 'indices': [84, 101]}],
     [],
     [],
     [{'text': 'BreastCancerAwarenessMonth', 'indices': [253, 280]}],
     [{'text': 'ReopenStrong', 'indices': [72, 85]}],
     [{'text': 'DCHOPE', 'indices': [232, 239]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': '2020Census', 'indices': [55, 66]},
      {'text': 'GetCountedDC', 'indices': [234, 247]}],
     [],
     [],
     [],
     [{'text': 'WorldTeachersDay', 'indices': [247, 264]}],
     [],
     [],
     [{'text': 'HispanicHeritageMonth', 'indices': [46, 68]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'DomesticViolenceAwarenessMonth', 'indices': [133, 164]}],
     [],
     [{'text': 'DCHOPE', 'indices': [125, 132]}],
     [{'text': 'PrincipalAppreciationMonth', 'indices': [84, 111]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'DontWaitVaccinate', 'indices': [185, 203]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'HispanicHeritageMonthDC', 'indices': [38, 62]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'FITDC', 'indices': [6, 12]}],
     [],
     [],
     [{'text': '202Creates', 'indices': [55, 66]}],
     [{'text': 'YomKippur', 'indices': [68, 78]}],
     [{'text': 'DCStatehood', 'indices': [22, 34]},
      {'text': 'GetCountedDC', 'indices': [217, 230]}],
     [{'text': 'AfricanHeritageMonth', 'indices': [50, 71]}],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'HispanicHeritageMonthDC', 'indices': [50, 74]}],
     [],
     [],
     [{'text': 'DCHOPE', 'indices': [101, 108]},
      {'text': 'MLKreimagined', 'indices': [110, 124]}],
     [{'text': 'MaskUpDC', 'indices': [69, 78]},
      {'text': 'DCHOPE', 'indices': [79, 86]}],
     [],
     [],
     [{'text': 'MLKreimagined', 'indices': [101, 115]}],
     [{'text': 'DCValues', 'indices': [79, 88]}],
     [],
     [],
     [{'text': '202Creates', 'indices': [191, 202]}],
     [],
     [],
     [],
     [{'text': 'DCRetail', 'indices': [39, 48]}],
     [],
     [],
     [{'text': 'DontWaitVaccinate', 'indices': [185, 203]}],
     [{'text': 'AfricanHeritageMonth', 'indices': [71, 92]}],
     [],
     [],
     [{'text': 'NationalVoterRegistrationDay', 'indices': [4, 33]}],
     [],
     [],
     [],
     [{'text': 'AgeFriendlyDC', 'indices': [43, 57]}],
     [{'text': 'NationalVoterRegistrationDay', 'indices': [201, 230]}],
     [],
     [],
     [],
     [{'text': 'WearAMask', 'indices': [87, 97]}],
     [],
     [{'text': 'GetCountedDC', 'indices': [94, 107]}],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'DCStatehood', 'indices': [97, 109]}],
     [{'text': 'FITDC', 'indices': [6, 12]}],
     [],
     [],
     [{'text': 'SustainableDC', 'indices': [248, 262]}],
     [{'text': 'RAMMYS20', 'indices': [0, 9]}],
     [{'text': '2020Census', 'indices': [53, 64]},
      {'text': 'GetCountedDC', 'indices': [237, 250]}],
     [],
     [{'text': 'DCValues', 'indices': [0, 9]}],
     [],
     [],
     [],
     [],
     [],
     [],
     [{'text': 'HIVAwarenessDay', 'indices': [179, 195]}],
     [],
     [{'text': 'RoshHashanah', 'indices': [102, 115]}],
     [],
     [{'text': 'DCMaternalHealth', 'indices': [63, 80]}],
     [],
     [],
     [],
     [{'text': 'Ward4', 'indices': [29, 35]}],
     [],
     [],
     [{'text': 'DCMaternalHealth', 'indices': [63, 80]}],
     [{'text': '202Creates', 'indices': [205, 216]}],
     [{'text': 'CitizenshipDay', 'indices': [6, 21]}],
     [],
     [{'text': 'MadeInDC', 'indices': [80, 89]}],
     [],
     [],
     [],
     []]




```python
hashtags_series = pd.Series(hashtags)
```


```python
tweet_counts = hashtags_series.value_counts()
tweet_counts
```




    ReopenStrong        91
    MaskUpDC            11
    DCHOPE              9 
    FamiliesFirstDC     5 
    DCStatehood         5 
                       .. 
    MillionManMarch     1 
    LGBTQ               1 
    TakeTheSurvey       1 
    DaveChappelleDay    1 
    DCproud             1 
    Length: 64, dtype: int64




```python
import matplotlib.pyplot as plt
from matplotlib.pyplot import figure

figure(figsize=(6, 8))

tweet_plot = tweet_counts[:15].plot(kind='barh')
tweet_plot.invert_yaxis()
plt.tight_layout()
```


    <IPython.core.display.Javascript object>



<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA4QAAASwCAYAAACjAoQOAAAgAElEQVR4XuzdB5QVRd7//y8iIkGQNRBUDJjwMYOKERMGUDBjXNTFNSBmBdOKKIgRIyuGVcxiWHN+zAEFFUUQRRQVUUwYQBSU+Z1P/f89z53Lnbm3Z7ru7fDuczwLMx2qXtX06c9WdVWjqqqqKmNDAAEEEEAAAQQQQAABBBDInEAjAmHm2pwKI4AAAggggAACCCCAAAJOgEDIjYAAAggggAACCCCAAAIIZFSAQJjRhqfaCCCAAAIIIIAAAggggACBkHsAAQQQQAABBBBAAAEEEMioAIEwow1PtRFAAAEEEEAAAQQQQAABAiH3AAIIIIAAAggggAACCCCQUQECYUYbnmojgAACCCCAAAIIIIAAAgRC7gEEEEAAAQQQQAABBBBAIKMCBMKMNjzVRgABBBBAAAEEEEAAAQQIhNwDCCCAAAIIIIAAAggggEBGBQiEGW14qo0AAggggAACCCCAAAIIEAi5BxBAAAEEEEAAAQQQQACBjAoQCDPa8FQbAQQQQAABBBBAAAEEECAQcg8ggAACCCCAAAIIIIAAAhkVIBBmtOGpNgIIIIAAAggggAACCCBAIOQeQAABBBBAAAEEEEAAAQQyKkAgzGjDU20EEEAAAQQQQAABBBBAgEDIPYAAAggggAACCCCAAAIIZFSAQJjRhqfaCCCAAAIIIIAAAggggACBkHsAAQQQQAABBBBAAAEEEMioAIEwow1PtRFAIF4CvXv3dgV65JFH4lUwSoMAAggggAACFRfw+Z5AIKx481IABBBAwGyZZZaxhQsXWqdOneBAAAEEEEAAAQRqCEyfPt2aNGliv/76a+QyBMLISTkhAgggEF6AQBjejCMQQAABBBDIigCBMCstTT0RQCCzAv/zP//j6j558uTMGlBxBBBAAAEEECgs4PM9gR5C7joEEEAgBgI+H/QxqB5FQAABBBBAAIEGCPh8TyAQNqBhOBQBBBCISsDngz6qMnIeBBBAAAEEEKiMgM/3BAJhZdqUqyKAAAI1BHw+6KFGAAEEEEAAgWQL+HxPIBAm+96g9AggkBIBnw/6lBBRDQQQQAABBDIr4PM9gUCY2duKiiOAQJwEfD7o41RPyoIAAggggAAC4QV8vicQCMO3B0cggAACkQv4fNBHXlhOiAACCCCAAAJlFfD5nkAgLGtTcjEEEECgsIDPBz3mCCCAAAIIIJBsAZ/vCQTCZN8blB4BBFIi4PNBnxIiqoEAAggggEBmBXy+JxAIM3tbUXEEEIiTgM8HfZzqSVkQQAABBBBAILyAz/cEAmH49uAIBBBAIHIBnw/6yAvLCRFAAAEEEECgrAI+3xMIhGVtSi6GAAIIFBbw+aDHHAEEEEAAAQSSLeDzPYFAmOx7g9IjgEBKBHw+6FNCRDUQQAABBBDIrIDP9wQCYWZvKyqOAAJxEvD5oI9TPSkLAggggAACCIQX8PmeQCAM3x4cgQACCEQu4PNBH3lhOSECCCCAAAIIlFXA53sCgbCsTcnFEEAAgcICPh/0mCOAAAIIIIBAsgV8vicQCJN9b1B6BBBIiYDPB31KiKgGAggggAACmRXw+Z5AIMzsbUXFEUAgTgJ60E+bPdc69B8Vp2JRFgQQQAABBBAoQWDGiF4l7FX/XQiE9bfjSAQQQCARAgTCRDQThUQAAQQQQKCgAIGQGwMBBBBAoEECBMIG8XEwAggggAACFRUgEFaUn4sjgAACyRcgECa/DakBAggggEB2BQiE2W17ao4AAghEIkAgjISRkyCAAAIIIFARAQJhRdi5KAIIIJAeAQJhetqSmiCAAAIIZE+AQJi9NqfGCCCAQKQCBMJIOTkZAggggAACZRUgEJaVm4shgAAC6RMgEKavTakRAggggEB2BAiE2WlraooAAgh4ESAQemHlpAgggAACCJRFgEBYFmYuggACCKRXgECY3ralZggggAAC6RcgEKa/jakhAggg4FWAQOiVl5MjgAACCCDgVYBA6JWXkyNQPoFGjRrVuJj+vswyy1jnzp2tb9++dvzxx1uTJk3KV6CEXenZZ5+16667zsaNG2c//vijs2vbtq1tsskmtv3221u/fv1sqaWWSlitylNcAmF5nLkKAggggAACPgQIhD5UOScCFRAIAqGCi7a//vrLZsyYYa+//rotWrTIdtppJ3vqqadsySWXrEDp4n3J8847z4YOHeoKuf7669vaa69tjRs3to8++sgmTZpkVVVV9vXXX1u7du2qKyLvVVdd1RlnfSMQZv0OoP4IIIAAAkkWIBAmufUoOwI5AkEgVHjJ3d58803Xw/X777/b7bffboceeihuOQITJkywzTbbzPX+/fe//7WePXvW8Pnqq6/sxhtvtBNPPNHatGlDICxw9xAI+SeFAAIIIIBAcgUIhMltO0qOQA2B2gKhdjr22GPt+uuvd2FQoZDt/wTOPvtsGz58eGgbegj/z5BAyL8oBBBAAAEEkitAIExu21FyBEoOhNdee60NHDjQdtllF3v66acXk1uwYIH9+9//tjvuuMOmTp3qhpjqJf/oo4+2I4880vK/T9QJpkyZYsOGDbPnn3/efvjhB1thhRXcsFQFrHXWWafGNV588UXbYYcd3Hd4F110kZ155pn25JNP2i+//OK+cTzppJPs73//e8EW/e677+ziiy+2Rx991D7//HNr1qyZdevWzZ1ju+22q/U6V1xxhSvLQw895L4JXGutteyUU05x9cnd/vnPf7oewJNPPtl0TLHt1ltvtSOOOKLgbt27dzfVVdtqq63myitL+d900002bdo0Nxx14sSJ1cc/8cQTNnLkSFNP5fz5890w1L333tsGDx5syy67bI3rDBkyxM4//3y75ZZbrEuXLq5+r7zyiqn9unbt6my32mqrxcq2cOFCu+SSS9xxM2fOtA4dOjhvHS8XlTO/Z7mYQ+7vCYRhtNgXAQQQQACBeAkQCOPVHpQGgXoL1NVDqKBw1llnFewFmzdvnu2+++4uWCy//PIuWCyxxBL2xhtv2Jw5c1woVO9i7va///u/tueee7oAs+mmm7qQoyCpoNOyZUtTyNl2222rDwkCoY5577337I8//jCFJ53/hRdesD///NMUdvQtX+6mc+68886mYZudOnWyDTfc0IVPTfyiY9TbefDBBy92nT59+tiHH35oP//8s22++eY2d+5ce/nll913lQp//fv3rz5G3w7quh07dnShTMG2ru3VV1914W7MmDHWokUL22+//ap3X3fddV2Qyw2ECpwKYqrvcsst58Lbgw8+6PYJ2kXfder38n/ttddcaJOpyqyJbYItCIQDBgxw51x55ZVtgw02sE8++cS5Lr300jZ+/Hj3HWSwKegpYD788MNuohyFdoVUBXn9WW1GIKz3PzsORAABBBBAIPECBMLENyEVQOD/E6grECpsKFyoB/CQQw6pQXbccce53sHDDjvMRo0a5QKdNvXMKcDpG8THHnvMevXq5X6uAKlwNnv2bHfcMcccU30+9XSpF05BRSGladOm7ndBINSfe/To4b7VU5jSpgCz44472m+//WZvv/22bbzxxu7n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QCCsdAtwfQQQQAABBOIrQCCMb9tQMgQQQCASAQJhJIycBAEEEEAAgVQKEAhT2axUCgEEEPg/AQIhdwMCCCCAAAII1CZAIOTeQAABBFIuQCBMeQNTPQQQQAABBBogQCBsAB6HIuBLoFGjRjVOveSSS1rr1q2tffv21qVLF9tzzz2tT58+pp/Xtc2bN89uuOEGe+SRR2zKlCk2Z84ca9Giha277rrWo0cP69+/v3Xs2LHGKX766Se7/PLL7dFHH7Vp06bZokWLbIUVVrDVVlvNtt12W9t///1t44039lV1b+fdfvvt7aWXXrLPPvvM1SUp2+GHH25jxoyxF154wVSH+mwEwvqocQwCCCCAAALZECAQZqOdqWXCBIJA2K9fP1dyhbKff/7ZPv74Y/voo4+sqqrK1lxzTbvzzjtt8803L1i7cePG2T777GNff/21NW/e3Lp162Zt27Z15xk/frx999131rRpU3vsscds5513duf4/PPPbbvttrMvvvjClllmGdtiiy1sxRVXtO+//94mTJhgP/74ox199NF2/fXXV19zyJAhdv7559stt9xiCi9RbFGEoPxyEAjnWof+o6JonpLOMWNEr5L2YycEEEAAAQQQqKwAgbCy/lwdgYICQSBU8Mvfpk+fbmeddZaNHTvWBb3XXnttsR67999/3wXA+fPn26BBg+zcc891PYPBpoD50EMP2RlnnGHnnHNOdZBTz6MC4h577GF33HGH65UMtj///NOeffZZmz17do3gRyD0exNHEY7pIfTbRpwdAQQQQACBJAsQCJPcepQ9tQJ1BcKg0hruefPNN9smm2xi77zzTrWFQuRGG21kkyZNMoW18847r1Yn9RZ++eWXtv7667vw2KpVK1Pw++STT6xTp04l+RIIS2Kq904EwnrTcSACCCCAAAIIlCBAICwBiV0QKLdAKYFQYW6llVYyfSf4yiuv2DbbbOOK+dRTT9nuu+9uK6+8svterth3hkHdZs2a5c6nTedWOCy26Vs8DTMttAXfvP3+++9uaKu+Y1RI1RBWDVXdcMMN7bjjjrMDDzywxuH530/m/jL/+z9953jttde64axy0PeQffv2db2iLVu2rHHe3CGjEydOtBEjRrjyqCy77rqrXXrppc4sf/vtt9/cN5X33nuvqXd2qaWWcoG7UNmDYxWyL7zwQtcW33zzjetpVfuc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BQusXbt2NmfOHJs0aZKtv/76ridw4403thkzZljfvn3t3//+t7Vp06b6eAXMAw880N577z3be++97cEHH6wVV+dYffXV3e/r6t0LAmHQY+irtQiEvmQ5LwIIIIAAAskXIBAmvw2pAQII5AgMHDjQrr32WjvppJNs5MiRBW3Uo6dQpwD47rvvun2OOeYYGz16tO2yyy725JNPVg8hzT2BguYGG2xg33zzjd1zzz0uOBbaCIRmM0b04r5EAAEEEEAAgQQIEAgT0EgUEQEEShd46623bIsttnA9gDNnzrTGjRsvdvB+++3nhnRedtllduqpp9oPP/zgviX8/fff3XDRzp0713pB9Rwed9xxttlmm5muRSAsTEUgLP2eZU8EEEAAAQQqKUAgrKQ+10YAAS8C6667rn300Uf29NNPux6/3E1DQxUWNWz0yy+/dENM77//ftt///1r9BjWVjANM9V3hRoKqh5D/Tl/o4eQHkIvNzYnRQABBBBAwIMAgdADKqdEAIHKClx44YVultHDDjvMbrvtthqFufnmm02TuvTo0cOeeeYZ97tzzjnHhg0bZv/4xz/cDKPFNk0AM336dHvuuedsp512IhAWAKOHsNhdxO8RQAABBBCIhwCBMB7tQCkQQCBCAfXQrbHGGtaiRQubPXu2NW/evPrsO+64o73wwgsuKCowajv22GPt+uuvtzPPPNOGDx9etCRbbrmljRs3rtbvCMP2ENZ1wT59+iw2i2lt+wcP9PzfK7wuatnWOvQfVbRuUe1AIIxKkvMggAACCCDgV4BA6NeXsyOAQIUEtttuO3vllVfsrrvusoMOOsiV4quvvrKOHTu6JSMUFFu2bOl+HkwoM3jwYLvooouKllhrEmoZinvvvde09mH+FjYQ1rXsxKabbmonnHBC0TJpBwJhSUzshAACCCCAAAI5AgRCbgcEEEilwI033mj//Oc/rVevXvbYY4+5Ol566aV2xhln2CGHHOLWEgy2YMjokUceaRpSWmzr1KmTffrppwwZrQOKHsJidxG/RwABBBBAIB4CBMJ4tAOlQACBiAV++uknN3nMX3/9ZbNmzbIVVljBNtpoI3v//ffdshK77bZb9RXvu+8+19On30+cOLHOkvz444+2/PLLu0llvvvuO/fn/C1sDyHrEEbc+JwOAQQQQAABBEoWIBCWTMWOCCCQNAHNHKoZ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f/75p5188sl22mmnuVGjaJk0aZJdeumldvPNN9uvv/7a7NoVEwg18rTNNtu4kcgLLrjAjjrqKJt77rnrzvnXX3/Zbbfd5up51113mcJWrZdaC4TqR40WRovC4A033GCnnHKKabT41FNPtfPOO6/eZ2bOnGmbbrqpC7cK6Qp8uYFcofD000+377//3p577rlmdw2BsNl0fBEBBBBAAIHUCxAIU9/FNLBSArNnz3ZTBTUCeP7557sw0Fh54403bI011mh29ZoKhAoiXbt2te+++870WU1fLFS+/vpr+/vvvysy4tbsBv/fF5MQCH0bFeI03VPhT78s6NGjR13zL7nkEjvhhBNcCBw7dqy1atWqII2mkmoksrmFQNhcOb6HAAIIIIBA+gUIhOnvY1pYIYH//e9/tu2229pSSy1ln332WbPeD9ToocKkRvY09VBTOXv37m1nnnmmm2Lqiw9F+ZrmR6yuueYaO+yww9zok6aGxi2aUjpkyBB78MEH7csvv3SBRdNfBwwYYFtssUW9w6neCp+qa76RLL17N3jwYDcqGh1N05TPzz//3BSmNaJ25ZVXumm1er9xhx12cKOamuaq4s9RqB06hi/686233upG3d599103YqupmJo6e8wxx9QbJfXf0ec0Uvriiy+6v1JbNd3zo48+avQdwnwjhNE66h1AjcIedNBBro0qCoidO3d204offfRR22qrreJ2T6zPEwhjcfFhBBBAAAEEMiVAIMxUd9PYkAJHHnmkXXXVVXb88cfbxRdfHPtUL730klvgRe/06R/miiuuaBq5U5jTu4gKnBtvvLE7roLaI4884hYh0ajTqquuWne+/v372/rrr2/bbbed+8wVV1xhRx99dKz66LwbbrihC7YKLpoGq2mLmt6oMKMpr8cdd1zdMUsNhCeeeKKr51prreUWt9H7jBrZ1MIsOqfev5s6daobUXvsscfcwiv9+vWzNm3a1NVBo6Aqs2bNst13393uueceF6h1TH3u1VdftW+//dZNodViP9EFffSzTTbZxE3vlOUKK6xg48aNc2FQAfb6668vuKhMU4HQ/6Jg6aWXtk8//dTVUaPDa665pnXo0MG1M/TiQgTCWJc/H0YAAQQQQCBTAgTCTHU3jQ0poPCiUKfRIC0UEqcoBC6//PJuoZc77rjDLUrjy1NPPeWCooKSApoWKlFpasqo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QACBggIEQi4OBBBAIOUCBMKUdzDNQwABBBBAoAQBAmEJeHwVAQQQSIIAgTAJvUQdEUAAAQQQqI4AgbA67pwVAQQQqJgAgbBi1JwIAQQQQACBxAkQCBPXZVQYAQQQiCdAIIznxacRQAABBBDIkgCBMEu9TVsRQCCTAgTCTHY7jUYAAQQQQKAoAQJhUUx8CAEEEEiuAIEwuX1HzRFAAAEEEAgtQCAMLczxEUAAgSoLEAir3AGcHgEEEEAAgRoWIBDWcOdQNQSaK9CiRYt6X51rrrmsXbt2tthii9kaa6xh2223ne2www6mv2+s/Pbbb3bdddfZww8/bOPHj7cff/zRWrdubSussIJtvvnm1r9/f+vcuXOzqrn//vvb8OHD631X9VY9V155ZTvooINs3333tdy2NOtkGf8SgTDjFwDNRwABBBBAoBEBAiGXBwIpFPAhar/99nOtmzVrlv3888/28ccf20cffWSzZ8+2bt262e233249e/bMKzBmzBjbaaed7JtvvrFWrVrZ2muvbR07dnTHee211+z777+3li1b2iOPPGKbbbZZbEUfCNdbbz1XF5W///7bPv30U3v11Vfd/z/44INdIM1amTRpknXt2tV69+5tzz33XMnNJxCWTMgBEEAAAQQQSK0AgTC1XUvDsizgA6GCX25R4DrttNPs7rvvdkHv5ZdftlVXXbXex959910XAGfMmGEnn3yyDRw40I0M+qKA+eCDD9pJJ51kZ5xxhincxS0+EN58880Nvv/oo49anz59XHB9/fXX3ahmlgqBMEu9TVsRQAABBBCorgCBsLr+nB2BIAKNBUJ/Qk33vPHGG2211VazN998s64eCmE9evSw9957zwYNGmRnnXVWwTpqtPDLL7+0lVZaKXY7GguEOtiGG25oL774ol122WV27LHHxj5+kr9AIExy71F3BBBAAAEEkiVAIExWf1FbBIoSKCYQKswtvvjipvcEFbzWX399d+zHHnvMtt56a1tiiSVs4sSJTb5nGK2QpnzedNNNLmh+9tln9vvvv9siiyziAuPee+9tu+++e93HmwqEu+yyi91777120UUX2QknnFD3PYXUwYMHm0YWu3fvbmeffbaNHj3afvjhB3vrrbfcaOfbb79td9xxhz399NP2xRdf2C+//OLautVWW7kRzU6dOtUd74033rA111zTevXqZZom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IJBMAQJhMvuNWmdcQKN8Ck8apVt22WXrNBSk+vTpY2+99Zbtsccedscdd9T97JlnnrFNN93UOnToYKNHj677nv680UYbuZA4ceJEF/p8UWg84IAD3KijRhN9ufbaa+3QQw+1Oeec0959910X+KKld+/e9sILL9jRRx9tV1xxhfvRP//8Y7vuuqs98MADbuRw8ODB9b6j4ygAzpgxw04++WQbOHCgGxn0ZdasWfbggw/aSSed5EY0999//4xfBcU3n0BYvBWfRAABBBBAIGsCBMKs9TjtTb2AAp6mdGokTaOGPsgpKI4aNcqNEOaO6h1zzDF25ZVX2sUXX2zHH398UUZbbrmlm0o6aNAgO+uss+q+o5G8nj17utHJL774ot5IoKacLrnkkm46q/4899xzu+9phLJHjx723nvvNThebmU0Wvjll1+6kUdKcQIEwuKc+BQCCCCAAAJZFCAQZrHXaXOqBfR+oR9Zmzx5si222GJuaugCCyxgf/75pwtTmgoaLS+++KJtuOGGppG95557rigfjdRddNFFdsghh5hGDH1RODz77LPtoIMOMk1tzS0apdRopaaNamRSRe8Zbr311q5eGqWca665iqqD/5ACpUZNb7zxRjdiqXZq5HTfffc1hV0fPP3nu3TpYp9//rkLoqqjwrDekWzXrp3tsMMOdsEFFzivaNG7jXr38s4773TvbGrEU9NZV199dfdeowKyL5pOu9RSS7nP5ZZbbrnFjbrKSWHalzjHj4Xzf9OKJ0yZbp36D4v71XqfnzSkT0nf58sIIIAAAgggUHsCBMLa6xNqhEBJAnq/b+WVV3YhSO8TaqTw7bffttVWW80WXnhh++677xocX2FEo3aaLqoFYIopO++8s913330Npn/uuOOObiGaq666yg4//PAGhzrxxBPdSOTll1/uwprKUUcd5cKWpsDqvcQ4RVNJtViN3oHUu45rrbWWa8urr75q3377rW2zzTZu8Z055pij7rA+EKoumtKq78hG72DKR4vl6B1MBTsVLdijwKyfK7SuscYabuRVC+doeu5uu+1mCnq+xA2EcY8fx0efZYQwrhifRwABBBBAIDsCBMLs9DUtzYiAFpvRqNd2223nVupU0f9q5Euh8M0338wroTD4008/uWmm888/f6NaWjRGNw+NxGmxGAUkXzRippCkULj99ts3OI4CmKas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wM4880x77rnnbPr06datWzc78MAD7ZhjjrE55pgjr9RPP/1kgwYNsgceeMC+/fZbV7cdd9zRBg8ebAsssEDe76guV155pd144432ySefWJs2bVx79J3u3bs3+I5+9vzzz9vEiROtS5cuQXrs999/tyeeeMJGjhxpr732mk2aNMlmzpzpDPr162cDBgxw9SxUbr31Vhs6dKiNHz/e5plnHlt77bXtjDPOsHXXXbfBVz788EN76KGH3PkmTJhgU6ZMsQUXXNB99rjjjrMNNtgg72latGjRaNtnzJhh8847b0k+BMKS+PgyAggggAACqRYgEKa6e2lcrQostNBC9ttvv9kqq6xSF+Lef/99F/IUPB588EHbeuut61VfwXGzzTZzIVIBbZ111nE/V/jS37344osuGEbLmDFjbNNNNzUFo549e7rg9cILL7iQp0B0zz33WG4gmTZtmju2Qs3SSy9ta665pqlu+k9BSsfs0KFDvfPMnj3bdt11V7v33ntdYNQ5p06d6s6lMPPss89ar1696n2nEoHwhhtusIMPPtidVzc7BdNffvnFXnnlFfv1119thRVWcKF0kUUWaXCpKCxedtllNt9889kWW2zhQvvTTz9taqvc+vbtW+87SyyxhH399dfWtm1b11aFQQXJcePGOWP9EuDYY49tcB79rHXr1rbzzjvnvVyvv/56m3vuuUu6lAmEJfHxZQQQQAABBFItQCBMdffSuFoVePnll22NNdZoMPJz9dVX2+GHH26dOnWyL774wuacc07XBI2+rbfeei6MnX766W70bq655qpr3meffeaCiIKmL//8848LPJ9++qkLIxqlUtEooQLO6NGj7aabbrIDDjigHtO+++5rI0aMsJ122sn++9//1p3n6KOPdqOT+vnw4cPrfUfHOeigg2zZZZd1wbRjx47u5/fdd58LOssss4xpBC1a50oEQo3wyUxtV918+eabb6xPnz721ltv2R577GF33HFHvfY888wzLtQq+MrJf1d/Vr0VEjWyqdDni0xlqaCtUO/Ltddea4ceeqjry3fffbfBaKkC4VJLLeVGL0MVAmEoWY6LAAIIIIBA8gUIhMnvQ1qQMgGFD436aUTOT7X0gUthQ6NwxRSNYmnUrkePHvb222/X+4qC0Oqrr24rrbSSG130RSOHmnaq8PLll1/WBTv9XNNVl1xySfvhhx/cSJgPffqZbiQaDdMUU00tjZYddtjBHn74YVdv1d+XSgTCxpwU7jSds2XLlm7UMBriFBZHjRrlRghzR/U01VZTYy+++GI7/vjji+kK23LLLd1UUgX5s846q953CIRFEfIhBBBAAAEEEAgkQCAMBMthEWiugEb1PvroIzdlU1M0VTQFcezYsW6qo58q2tTx99tvP9MI2TnnnOPee8stGrXTyGL0Hb6bb77ZvV+o0bGnnnqqwXc0Cqhwqs/tv//+7uf6vqaWatTs559/bjC9UaONGlVUfW655Za8gVDvUyp86X1HvdOn6bLnnXdevXcijzjiCBs2bJhdd911ddNAoxXUVE55aaRN7dKoW2NF02g1VVNl8uTJtthii7k/a2qopr0qACsUaypotGgEdMMNN7TevXu79zKLKXov9KKLLrJDDjnENGIYLQTCYgT5DAIIIIAAAgiEEiAQhpLluAg0Q0ABTsFpueWWc+FIi77oXTcFFIUXLfby6quvuhE3jdR17tzZNAKnkb7csuqqq9o777xj//vf/2ybbbZp8PNddtnFjdrpfUUdQ0WjYVdccYWdeOKJduGFFzb4zlVXXWVHHnmk+5wCnIq+r/fp1lprLRdac4tGOlU/1Ucjk774EUIf9LToiqbKaoqnQp2CmEbxfCDTSKbeuSx0Hr3fp3cst9pqK3v00Ueb1Ne7fSuvvLILsDLWSKGKRlNXW201W3jhhd2CP7lF734qtGq6qPqgmKJps5o+q8V9tMhOtCgQaqqvTDVNuFWrVu78mrLb2II3xZzXf4Ypo3G0+CwCCCCAAALZEiAQZqu/aW2NCWjUSIFJIUMBUH9WKFLg0zuGKgqAWt1SIUFTHBXKcgPFCSec0CDAtW/f3n788UcXChWkcoveq7v88svd9MejjjrK/VghRNM+FQr1zmBu0SqamhKqzyngqOj7mkapUHj//fc3+I5GDRVoVR8tWOOLD4R6r1DH9aH177//du/i3X777Q2OqfcoNUqq0KapsNGy++67u3ceVS/Vr6mixWa06Mx2223nvH3RnxWQ5f3mm2/mPYzCoMK5pprOP//8jZ5K73DqRqsRx9dff72uX/2XCq0yqvcX9a6mpq+WWgiEpQryfQQQQAABBNIrQCBMb9/SsgQIaERLI1u+6B09TbHUdERfHnvsMTeFUsFJC8Uo/GlUTaNHGp1TGNP0Ry1Io8VLfNE7cQpX0amnURJNI/33v//tpmaeeuqp7kdaGOXJJ580rWzZv3//BoKaRrr55pu7zz3++OPu5/q+FrrZa6+97LbbbmvwHdVZo3Cqj0KRLz4Q7rnnni78RYuCo6Z8assFjZr57TT8CKpGKbXAjS/6vD6j4Klpnk2tyqn3A7fddltnqu0oouFSC8yoLQqfmsqar/gVRaNTTfN9Tm3feOON3XF22203t11IbtGIsAw0WtmuXTvXX1oESNeBzDRFVSvEFlMKbVeiUDqrTUfr1H9YMYcp+JlJQ0oPpyVVgC8jgAACCCCAQNkFCIRlJ+WACMQX0GiTpkRqL0GFrnPPPdeFLBVN+VR4Ucm3IqafxqmQojDkiw+EWqBG7wvmFh1fYS4aCBX2dH6NnOl9wdyisKgwGA2ECpUKl3vvvbcLMbmlqUCoETmN0uUWjTgq8N59992m6a0qer9PwU+rriqM6b1FFU1f1TYRJ598sg0ZMqTRDtBIrMKeRk81QqpAHS0Kp2qLtvBQGMtXVAedv6lAeNhhh9k111zj3rFU8NQoabHltNNOs/PPP98FcC1IU0whEBajxGcQQAABBBBAICpAIOR6QKCGBDSip0VjNFVRU0X1vpz28vMjhgpkGlWMFo0OarRQi6pERwOTMmW0qSmtuaHNT3XVaOE+++zjKHQjU9DTYjzR7SVyu/arr75yYVCjjgqQl1xySYPeL9eUUYV7rSiq1Vg1QugXCCr2ctNUW00b1Xuk2iokugpqscfwn2PKaFwxPo8AAggggEB2BAiE2elrWpoQAb1XqFUpBw4c6EYMFV78ipnauD5f4FHo0AIo2t9Q7xmqJGVRmUKB0C9wkxsIFfq0EqtW+tSm8nqnUCFPUzO1f2ChMnXqVNPCNdoPUe8o3njjjW7D+NxS7KIymp6qUcZ8xY/aagqoViJVXzSn6H1S7ZmobT705+YWAmFz5fgeAggggAAC6RcgEKa/j2lhwgT81g96H1DvBapoFUq9J6cVOLUFRbRo+qSmTv7111/1FpApdtsJbdHQtWtXd8hit52Ibmhf7LYTuRva+3cIC00Z9QvcRKeM+nYr/CloKdxpiqi2s9C7f5pSm69oFdFNNtnELeqi4+qY2msxX9F7i1o0pqltJ3wgzT2Gppxq5FJ9oqmeCqvNKerXtm3bugWHNFqoPze3EAibK8f3EEAAAQQQSL8AgTD9fUwLEyag/f20uqRGCrWAjIpGtBR69E7ZKaecUq9Fmo6okS8FEL2L6KcWKvRoIZPGNqbXxvda2dQXjUbpXUQttqL3ERdZZJG6n/mN6RVMNWK16KKL1v1Mx9GUzcY2ps8Ndj4Q5luMxm+poemwGiHN3QtQi7Mo/GlfPy1kM++887r3+fzWEVEg1VuL8jz77LNug3gF0KamX2rFU21d0djG9NqWQ9tzRIsWq9EKpZrmOXLkSPeuZXOLjqUVRjXVVFOBSykEwlL0+C4CCCCAAALpFiAQprt/aV0NCmihEoWXfv36ueDli94f1AIkmiqpYKOpkVp1VGX8+PFu6whNQdSiL9oSQUXTRBV29M6hVh4dOnRoveMtv/zybuN4rVqpd+9UNOKkhUq0x1++xWO0oIpGuVQ/BS9fRy2+oi0m8i0eo+NoGwdNZ1VA9UFS21DoOBqBVHuiq3/6QKi/U3hSWFPRIjRa0EbvCCpcaWGZ3KLRUIXE77//3v0oui9i9LMzZ850C9IoqCo0a8VW7fPXVPGrqeodPjn5abr6s0Yn1T9yjS4So+m6clU/3nPPPW57jqaK9oFUv2rfyWjRVFitPKrrJNp3TR2v0M8JhM2V43sIIIAAAgikX4BAmP4+poU1JqCRPo34aRqo9hpU6ND7bVplVCN0Gu3SCOGuu+5ar+baZkF7AyqMaOEZLSSjEKL32FZffXU3hTJ3Tzy9X6dFaDQNUlNN9S6iAqnOo8CiPfs0mhUtqov2PdRWBVqddM0113SjiNrIXf9f01ZV92jR9EZtvq7gpemWm266qWuTgo3qq601/LuN/nu5G9NrCqbfmF5hS39WAOvcuXPeHtSKohqlU1Hd8q2wqf0UFRZVtGppoWmXF198cYM2+XcYFSAV9BRCtaiP2qrRTgXdaPF7Eyr8qi35ilYujW7n4UeDFTj1Pb/thN5jVNHeigrnuX0U95ImEMYV4/MIIIAAAghkR4BAmJ2+pqU1IqCwoxE1hSW9v6fgpCmMXbp0ce+5KfQVWpFS76QpvIwdO9ZtwaCApmmhmlpaaORLYU6rXSowarVKfefAAw90QanQe3QKmfqORuemTJniVsrUaN3gwYMLbp2g0TgFML1fqDDZunVrtzqqFsbJF9Z8IJSHLLR4jN4J1Pc0ZVPbYeROFY12oSw0qqigqWCcrwwaNMjVuamiOsg/tyi8a9RV02E1kqmgrC02FOxyS6EN5qOf03udOqYvmpaqwPfGG2/Yt99+6/pHo476RYH6SCG7HIVAWA5FjoEAAggggEA6BQiE6exXWoVA6gX0/uD111/vFsLRSBulsACBkKsDAQQQQAABBAoJEAi5NhBAIHECn3/+ua244opuNFGLzvgN6hPXkApVmEBYIWhOgwACCCCAQAIFCIQJ7DSqjEBWBbTy6rvvvuve5dNUVk1R1RRbSuMCBEKuEAQQQAABBBBghJBrAAEEEi/g3ztcfPHF3ZYTAwcOzLu5fOIbWuYGEAjLDMrhEEAAAQQQSJEAI4Qp6kyaggACCOQTIBByXSCAAAIIIIAAI4RcAwgggEBGBQiEGe14mo0AAggggEARAowQFoHERxBAAIEkCxAIk9x71B0BBBBAAIGwAgTCsL4cHQEEEKi6AIGw6l1ABRBAAAEEEKhZAQJhzXYNFUMAAQTKI0AgLI8jR0EAAQQQQCCNAgTCNPYqbUIAAQQiAgRCLgcEEEAAAQQQKCRAIOTaQAABBFIuQCBMeQfTPAQQQAABBEoQIBCWgMdXEUAAgSQIhLzRJ6H91BEBBBBAAAEECguEfE5oMXv27NngI4AAAghUVyDkjb66LePsCCCAAAIIIFCqQMjnBAJhqb3D9xFAAIEyCIS80ZehehwCAQQQQAABBKooEPI5gUBYxY7l1AgggIAXCHmjRxkBBBBAAAEEki0Q8jmBQJjsa4PaI4BASgRC3uhTQkQzEEAAAQQQyKxAyOcEAmFmLysajgACtSQQ8kZfS+2kLggggAACCCAQXyDkcwKBMH5/8A0EEECg7AIhb/RlrywHRAABBBBAAIGKCoR8TiAQVrQrORkCCCCQXyDkjR5zBBBAAAEEEEi2QMjnBAJhsq8Nao8AAikRCHmjTwkRzUAAAQQQQCCzAiGfEwiEmb2saDgCCNSSQMgbfS21k7oggAACCCCAQHyBkM8JBML4/cE3EEAAgbILhLzRl72yHBABBBBAAAEEKioQ8jmBQFjRruRkCCCAQH6BkDd6zBFAAAEEEEAg2QIhnxMIhMm+Nqg9AgikRCDkjT4lRDQDAQQQQACBzAqEfE4gEGb2sqLhCCBQSwIhb/S11E7qggACCCCAAALxBUI+JxAI4/cH30AAAQTKLhDyRl/2ynJABBBAAAEEEKioQMjnBAJhRbuSkyGAAAL5BULe6DFHAAEEEEAAgWQLhHxOIBAm+9qg9gggkBKBkDf6lBDRDAQQQAABBDIrEPI5gUCY2cuKhiOAQC0JhLzR11I7qQsCCCCAAAIIxBcI+ZxAIIzfH3wDAQQQKLtAyBt92SvLARFAAAEEEECgogIhnxMIhBXtSk6GAAII5BcIeaPHHAEEEEAAAQSSLRDyOYFAmOxrg9ojgEBKBELe6FNCRDMQQAABBBDIrEDI5wQCYWYvKxqOAAK1JBDyRl9L7aQuCCCAAAIIIBBfIORzAoEwfn/wDQQQQKDsAiFv9GWvLAdEAAEEEEAAgYoKhHxOIBBWtCs5GQIIIJBfIOSNHnMEEEAAAQQQSLZAyOcEAmGyrw1qjwACKREIeaNPCRHNQAABBBBAILMCIZ8TCISZvaxoOAII1JJAyBt9LbWTuiCAAAIIIIBAfIGQzwkEwvj9wTcQQACBsguEvNGXvbIcEAEEEEAAAQQqKhDyOYFAWNGu5GQIIIBAfoGQN3rMEUAAAQQQQCDZAiGfEwiEyb42qD0CCKREIOSNPiVENAMBBBBAAIHMCoR8TiAQZvayouEIIFBLAiFv9LXUTuqCAAIIIIAAAvEFQj4nEAjj9wffQAABBMouEPJGX/bKckAEEEAAAQQQqKhAyOcEAmFFu5KTIYAAAvkFQt7oMUcAAQQQQACBZAuEfE4gECb72qD2CCCQEoGQN/qUENEMBBBAAAEEMisQ8jmBQJjZy4qGI4BALQmEvNHXUjupCwIIIIAAAgjEFwj5nEAgjN8ffAMBBBAou0DIG33ZK8sBEUAAAQQQQKCiAiGfEwiEFe1KToYAAgjkFwh5o8ccAQQQQAABBJItEPI5gUCY7GuD2iOAQEoEQt7oU0JEMxBAAAEEEMisQMjnBAJhZi8rGo4AArUkoBv9hCnTrVP/YSVVa9KQPiV9ny8jgAACCCCAQO0JEAhrr0+oEQIIIFBWAQJhWTk5GAIIIIAAAqkSIBCmqjtpDAIIINBQgEDIVYEAAggggAAChQQIhFwbCCCAQMoFCIQp72CahwACCCCAQAkCBMIS8PgqAgggkAQBAmESeok6IoAAAgggUB0BAmF13DkrAgggUDEBAmHFqDkRAggggAACiRMgECauy6gwAgggEE+AQBjPi08jgAACCCCQJQECYZZ6m7YigEAmBQiEmex2Go0AAggggEBRAgTCopj4EAIIIJBcAQJhcvuOmiOAAAIIIBBagEAYWpjjI4AAAlUWIBBWuQM4PQIIIIAAAjUsQCCs4c6haggggEA5BAiE5VDkGAgggAACCKRTgECYzn6lVRkX+P333+2JJ56wkSNH2muvvWaTJk2ymTNnWrdu3axfv342YMAAa9OmTV6lW2+91YYOHWrjx4+3eeaZx9Zee20744wzbN11123w+Q8//NAeeughd64JEybYlClTbMEFF3SfPe6442yDDTZotCe+/PJLd64nn3zS1XH69Onu+z169LAdd9zR9t1334L1zHgXx2o+gTAWFx9GAAEEEEAgUwIEwkx1N43NisANN9xgBx98sGuu/pF3797dfvnlF3vllVfs119/tRVWWMGef/55W2SRReqRKChedtllNt9889kWW2xhf/zxhz399NM2e/Zsu+eee6xv3771Pr/EEkvY119/bW3btrVevXq5MKcgOW7cOGvRooVdeumlduyxx+Zlv/baa93PdA7VY6211nLH+fbbb23MmDE2Y8YM69ixozvWQgstVFNdt9FGGzm/iRMnWpcuXWqqbvkqQyCs+S6igggggAACCFRNgEBYNXpOjEA4AY3yKVRplG7ZZZetO9E333xjffr0sbfeesv22GMPu+OOO+p+9swzz9imm25qHTp0sNGjR9d9T39WAFJIVABS6PNFofGAAw5wo44aTfRFYe/QQw+1Oeec0959910XSKPFB1aNUl511VW2zz77uADpi0Y49ffnnHOO+36thS4CYbhrlyMjgAACCCCAQGUFCISV9eZsCFRdQAFPUzpbtmzpRg19kFNQHDVqlBshzB3VO+aYY+zKK6+0iy++2I4//vii2rDlllu6qaSDBg2ys846q+47X331lQubf/75pxt93HjjjQse74MPPrBFF120Xggt6uSBP0QgDAzM4RFAAAEEEECgYgIEwopRcyIEakNAo2+tW7d2lZk8ebIttthibtrmAgss4EKa3uvTVNBoefHFF23DDTe03r1723PPPVdUQ0466SS76KKL7JBDDjGNGPpyyimn2AUXXGC77bab3XXXXUUdy39II4Wff/65zZo1y717qJFGvbu43HLL2dtvv113rPfee8+GDBni6jp16lQ36qmAqmCaO9r4008/2YgRI+yRRx4xvROpKasaudQUVoXfzTffvO64es+xa9eu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G4Vs9RwMhK2K+XkFFFBAAQWqI2AgrE5be6YKDFmgNhDefPPN4etf/3qoNzLGQbbbbrtw1llnhZtuuimsttpqfcdlP/POO2+c+njkkUfGz7zwwgthvvnmCz/+8Y/js30UnqM79NBDY0iaYoopwvrrrx+OP/74MMsss/Q7B/Z9yy23hH/84x+BwMRneBZv5MiRYZ111glHHHFEmHPOOfttM9AzhPk6Tz755PH5QgIbdV5llVXiCN1iiy1Wd18DOWQfPu2008LYsWMnmfbJc4EXXXRR2HfffcO4ceOG3D6NNjQQNhLy7xVQQAEFFKiugIGwum3vmSvQtEC7A+EyyywTrr/++vDVr3411oFQ97///S9OmZx++unDd77znbDkkkvG8Hj33XfH0MgzerfeemsMaFnJAuFuu+0Wn9EjuI0aNSrcddddcZrmXHPNFe688874v1lpFAj33nvvOJK3+OKLhwUXXDA88sgj4cknn4xh9NFHHw2f//znJ9lXo0D4zjvvhJlmmil8+umn4fnnnw9zzz13/PeZZ545MIX1oYceCksssUTT7dHqBw2ErYr5eQUUUEABBaojYCCsTlt7pgoMWaCdgZBKELauueaavqDGSOLqq68e5phjjvic3K9//euwySabxPq+/fbbYcUVVwyPPfZYHDlkZLI2EE455ZThD3/4Q9/zdyzCwmjjeeedFzbaaKNw6aWXNh0IGR0899xzYyilsNDLt7/97XDJJZeEAw44IBxyyCEtB0I2+OIXvxhHRq+99tqw1lprxX/nzz7zmc+E9957L46EpioGwlSy7lcBBRRQQIHiCxgIi9+GnoECyQXaHQhrgx0nwOsVHnjggfiaBqaS5ssvfvGL8P3vf3+SV0VkI4RbbLFFDH/58tprr8URxv/+979xVC6bOtpohHCrrbYK55xzTr99US/qx8IwTJfNSjPPEGafZTSUkcsLL7wwBkxGPldYYYU44sgiN+0oA73e4plnngmfjpw9jBo7fliHmTBu9LC2d2MFFFBAAQUU6D0BA2HvtYk1UqDnBNoZCHmXHiGNkbh82XTTTcPvf//7GMYIZfnCap3rrbde+O53vxtHD7OSBcIrrrgiPmdYWxgdvPzyy8PFF18c2D+lUSA8++yzw9Zbb91vV++++26cysq7BZ944okhBULCHyGQZwY322yzGA4JiQbCnrvcrZAC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Ndx88819n8k+P3HixPhnjbav3fm8884bJkyYEP/5whe+0O+vp5pqqjDjjDOGueeeOyy33HJhzJgxYc0112x4jNdeey2MHz8+XH311eHpp58Ob775ZtwPN+jRo0eH7bffPsw222xDbicD4ZDp3FABBRRQQIHSCxgIS9/EnqAC5RbIAt22225b90QXWWSRsN9++w0YCLfbbrtJtrvtttvCM888E5Zccsmw1FJL9fv7WWedNRx77LF9gXC66aaLwY/yySefxDD36KOPxr+nLLvssuH8888PCy20UN36XXHFFWGbbbYJb731VphpppnC8ssvH2aeeeZASLzrrrvC22+/HWaYYYZwxx13xIA4lGIgHIqa2yiggAIKKFANAQNhNdrZs1SgtAK1I36NTrSZzxMSzzrrrHDggQeGgw46qO4usxHCbMSw9kMPPfRQ2HvvvcONN94YZp999nDvvffGkcN8ufbaa8O6664bJp988nDUUUeFPfbYI4wYMaLvIx9++GE499xzw//93/+FCy+8MKy22mqNTq/u3xsIh8TmRgoooIACClRCwEBYiWb2JBUor0AzAS9/9s18vh2BkGMyYkjg+/Of/xw22mijcOmll/ZV5f33349TTl9++eVw5plnhoFGONnghRdeCB999FGYb775htSQBsIhsbmRAgoooIAClRAwEFaimT1JBcor0EzA61Yg5Lg8E5hNF2VUcZ555onVOeWUU8Iuu+wSp4gyNTRlMRCm1HXfCiiggAIKFFvAQFjs9rP2ClReoNcDIQ305S9/Odx3333h7LPPDltvvXVss/XXXz/88Y9/DCeeeGLYc889k7ajgTAprztXQAEFFFCg0AIGwkI3n5VXQIEiBMKddtopnHrqqeEnP/lJOOKII2KjzTXXXHEq6F/+8pew8sorJ21IA2FSXneugAIKKKBAoQUMhIVuPiuvgAKNXhvxxhtvxNU7s9JMgGzXM4TZMQmC48aNCzvvvHM4+eST4x9PM8004YMPPgiPP/54WHjhhdvSkAOtQsqKqZ+OnD2MGju+qeNMGDe6qc/5IQUUUEABBRQovoCBsPht6BkoUGmBRq+d4P1+0047bVcDIa+9YBVRnhmkPgbCSl+ynrwCCiiggAI9JWAg7KnmsDIKKNCqQDMjfvl9NvP5do8Qjh07Npx22mlh//33D4cddlisjlNGW21pP6+A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KKCAAgoooIACxRIwEBarvaytAgoooIACCiiggAIKKNA2AQNh2yjdkQIKKNC6wAcffBCOPPLIcMEFF4Tnn38+zDyGhMu1AAAPHklEQVTzzGHttdcOhxxySJhrrrla36FbDFvg/fffD3/+85/DlVdeGe69994wYcKE8Mknn4QFF1wwbLLJJmHvvfcOI0eOrHucs88+O/zqV78Kf/vb38JUU00VVlhhhfDTn/40rLjiisOulztoXuD1118PiyyySHjllVfCwgsvHB5//PEBN7bNmndN9cn//Oc/4aijjgpXXXVV+Oc//xmmmWaa8IUvfCGsscYa4eijj57ksH/84x/DMcccE/7617+GiRMnhqWXXjr86Ec/Cuutt16qKrrfnMBdd90V/W+//fbw2muvhemnnz62wS677BLGjBkzidWnn34afvGLX4TTTjstPP300/H+udpqq4WDDz44LLbYYtr2gICBsAcawSoooEA1BQiDdHjuuOOOMMccc4RVVlklho977rknzDbbbOHOO+8MCyywQDVxunjWp556athpp51iDXi5Mh2Wt99+O7bTO++8E4PGLbfcEj73uc/1qyVB8fjjj4+d2bXWWivQvjfccEPssP7ud78LG220URfPqlqH3m677QJBD/vBAqFt1v3rgvvcuuuuG9588834XVt88cXj94wfVf71r3+Fjz/+uF8lCRbf//73w5RTThnWXHPN8JnPfCb+gPPf//43nHjiiWHPPffs/kmVuAbcyzbffPNAyFtuueXif6NefPHFGA75s3333TeMGzeuT4Dv4GabbRZ+//vfh5lmmin+N+/VV18Nt956a5h66qnDTTfdFJZffvkSixXj1AyExWgna6mAAiUU+NnPfhYOPfTQ8NWvfjV2aLJRp+OOOy7ss88+4Wtf+1oMHpbOChAk+AV8r732Cl/84hf7Dv7vf/87jB49Ojz44IPhO9/5Tjj//PP7/u7GG2+MHZ1ZZpklBvlsO/6dX8IJif/4xz/CZz/72c6eTAWPRggnKHz3u98Nv/nNbwYMhLZZ9y8OggQ/uvzvf/8L55133iQ/mvDj2Fe+8pW+ij755JPx81NMMUUMEtw7Kfw5o/BvvfVWDJL57233z7I8NSCcjxo1Ko68X3jhheHb3/5238lxr1t99dVjWz711FN9P2aefvrpYccdd4xt8pe//CXMPvvscZtL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" width="600">



```python
tweet_counts.sum()
```




    217


