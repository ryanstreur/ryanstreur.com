server {
  server_name ryanstreur.com www.ryanstreur.com;
  root /var/www;



    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/ryanstreur.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/ryanstreur.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

    # Forward requests to phoenix server running on port 4000
    location / {
      proxy_pass http://127.0.0.1:4000;
    }

}
server {
    if ($host = ryanstreur.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


  server_name ryanstreur.com www.ryanstreur.com;
    listen 80;
    return 404; # managed by Certbot


}