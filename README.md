# README

memurl is a URL shortening service. Give it an arbitrary URL and it will give back an easy-to-write-down URL.

memurl will also collect some stats on the shortened URL. For each visit, the following will be recorded:
- Referrer
- Timestamp
- IP address
- Browser
- Operating system

The stats can be queried through a stats endpoint: /stats/url. The stats are returned in JSON format. 
