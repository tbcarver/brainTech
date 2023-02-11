## account pages
SITE_URL='http://www.fashionphile.test'
SITE_URL='http://www.account.fashionphile.test'

the account pages are sent back to account.fp so at times its better to set the site url to the account site.

## 2 php.ini
there is a fpm and cli php.ini under /etc/php/7.3

## Memcached
This is installed as a service with pecl, remember to start it

## Elasticsearch
To turn off elastic search in web app comment out `use Searchable;` from the ProductModel.php and OrderModel.php