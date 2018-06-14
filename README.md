# README

memurl is a URL shortening service. Give it an arbitrary URL and it will give back an easy-to-write-down URL. Hitting the short URL will redirect to the original URL.

memurl will also collect some stats on the shortened URL. For each visit, the following will be recorded:
- Referrer
- Timestamp
- IP address
- Browser
- Operating system

The stats can be queried through a stats endpoint: /stats/url. The stats are returned in JSON format.

## Thought Process

Thought process logs can be seen in .plan. This file was updated throughout the exercise.

## Design decisions

- the gem https://github.com/jpmcgrath/shortener was not used. I expect the tester will like to see how I code, not how I get around requirements
- User authentication was not implemented to keep things simple, as it was stated that this is optional. It can be added in future improvements
- Again to keep things simple, no security was added to the /stats API endpoint
- short URLs are generated using the record ID as an integer input to hashids. The Ruby implementation of https://hashids.org was used.
- remote_ip, HTTP referer and UserAgent are recorded in the url visits. UserAgent is parsed to identify the browser and the os. The useragent gem was used to do this.

## Future improvements

- Add user authentication (was specified as optional)
- Stats - add Google Analytics-like features:
  - Add GeoIP and determine the geographical distribution of the url visitors
  - Show the distribution over time of the url visitors
  - Show the browser and os breakdown of the url visitors
