import time
import urllib

import requests
from bs4 import BeautifulSoup

WIKI_BASE_URL = 'https://en.wikipedia.org'


def continue_crawl(search_history, target_url, max_steps=25):
    """
    This function will provide feedback on if a target url has
    already been seen OR the search history is too large
    """
    return (target_url not in search_history) and (len(search_history) < max_steps) and (len(search_history) == len(set(search_history)))

def find_first_link(url):
    """ return the first link as a string or return None if there is no link """
    response = requests.get(url)
    html_text = response.text
    soup = BeautifulSoup(html_text, 'html.parser')
    content_div = soup.find(id='mw-content-text').find(class_='mw-parser-output')

    article_link = None

    for elem in content_div.find_all('p', recursive=False):
      if elem.find('a', recursize=False):
        article_link = elem.find('a', recursive=False).get('href')
        break

    if not article_link:
      return

    # Build full url from relative wiki link
    return urllib.parse.urljoin(WIKI_BASE_URL, article_link)

start_url = 'https://en.wikipedia.org/wiki/Banana'
target_url = 'https://en.wikipedia.org/wiki/Philosophy'
article_chain = [start_url]

while continue_crawl(article_chain, target_url):
    # download html of last article in article_chain
    # find the first link in that html
    first_link = find_first_link(article_chain[-1])

    if not first_link:
        print("Search ended because we didn't find a link")
        break

    print("Next Link: {}".format(first_link))

    # add the first_link to the History
    article_chain.append(first_link)

    # wait some time
    time.sleep(2)
