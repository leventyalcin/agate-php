# agate-php

Enable webtatic-testing repository and add following configuration to hiera for installing PHP7 

```
---
classes:
  - php


php::ensure: 'installed'
php::prefix: 'php70w-'
php::packages:
  - cli
  - common
  - devel
  - fpm
  - gd
  - mbstring
  - mysqlnd
  - pdo
  - xml
  - pear
```

