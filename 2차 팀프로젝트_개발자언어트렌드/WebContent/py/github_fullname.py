from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.keys import Keys
import time
import re
import json
import pandas as pd
import pyperclip
import getpass
import urllib.request
import random
import requests
from urllib.parse import urlparse
import urllib.parse
import sys
from bs4 import BeautifulSoup


sys.stdout = open('want_content.txt', 'w', encoding='utf8')

driver = webdriver.Chrome(ChromeDriverManager().install()) # Chromedriver PATH

driver.implicitly_wait(6)


driver.get('https://github.com/')

time.sleep(3)
data = driver.find_elements_by_name('#js-pjax-container > div.position-relative.container-lg.p-responsive.pt-6 > div > div:nth-child(2) > article:nth-child(1) > h1 > a')[0]
data.click()
time.sleep(3)
#driver.find_element_by_xpath('#__next > div.JobList_cn__t_THp > div > div > div.List_List_container__JnQMS > ul > li:nth-child(1) > div > a > div > div.job-card-position').click()

contents = driver.find_elements_by_css_selector('.list-style-none')
for i in contents:
    content = i.text

    print(content)

driver.close()
"""
contents = driver.find_elements_by_css_selector('.JobDescription_JobDescription__VWfcb')

for i in contents:
    content = i.text

    print(content)


    with open(content, 'w') as c:
          c.write(content)
          c.close()

    sys.stdout.close()
    """