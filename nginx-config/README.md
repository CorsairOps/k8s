# NGINX Config

These configs assume using k3s with Traefik disabled and nginx as the ingress controller.

## Steps
1. Copy the config files to /etc/nginx/sites-available/
2. Link the config files to /etc/nginx/sites-enabled/
3. Test the nginx config with `nginx -t`
4. Reload nginx with `systemctl reload nginx`
5. With certbot run `certbot --nginx -d corsairops.com -d www.corsairops.com -d api.corsairops.com -d auth.corsairops.com`
6. Test the nginx config again with `nginx -t`
7. Reload nginx again with `systemctl reload nginx`
8. Check the status of nginx with `systemctl status nginx`