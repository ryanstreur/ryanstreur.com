# ryanstreur.com

_author_: Ryan Streur

Once again, I've nuked my personal website and will be rewriting and redeploying it. It became too complex and I am looking to simplify it.

## Configuration

### Compose Environment

In order to test the caddy configuration locally:

1. Add a .env file at the root of the project
2. Use the RSDC_CADDYFILE environment variable to specify an alternative caddyfile. Built-in options are
   1. Caddyfile - production caddy configuration
   2. CaddyfileLocal - same as prod, but hosts on localhost

### Server environment

| Variable           | Usage       |
| :----------------- | :---------- |
| DJANGO_STATIC_URL  | STATIC_URL  |
| DJANGO_STATIC_ROOT | STATIC_ROOT |
| DJANGO_DEBUG       | DEBUG       |
