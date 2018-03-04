# 申请 Let's Encrypt 永久免费SSL证书

## 安装Let's Encrypt前的准备工作

* Python2.7以上版本
* Git

## 快速获取Let's Encrypt免费SSL证书

```shell
git clone https://github.com/letsencrypt/letsencrypt
cd letsencrypt
./letsencrypt-auto certonly --standalone --email admin@bflyer.com -d bflyer.com -d www.bflyer.com
```

## Let's Encrypt免费SSL证书获取与应用

### Apache，修改ssl.conf文件

  ```
  <VirtualHost _default_s:443>
  DocumentRoot "/var/www/html"
  ServerName www.yourdomains.com:443
  SSLEngine on
  SSLCertificateFile /etc/letsencrypt/live/factorydirectsale.de/fullchain.pem
  SSLCertificateKeyFile /etc/letsencrypt/live/factorydirectsale.de/privkey.pem
  </VirtualHost>
  ```

### Nginx，修改nginx.conf

```
server {
    listen 80;
    server_name www.bflyer.com;
    return 301 https://$host:4443$request_uri;
}
server {
  listen      4443;
  server_name blog.bflyer.com;
  index       index.html index.htm index.php;
  root        /var/www/html;

  ssl on;
  ssl_certificate     /etc/letsencrypt/live/bflyer.com/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/bflyer.com/privkey.pem;
  ssl_ciphers         "EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH";
  ssl_protocols       TLSv1 TLSv1.1 TLSv1.2;
  ssl_prefer_server_ciphers on;
  ssl_session_cache   shared:SSL:10m;
}
```

## 参考

* http://www.laozuo.org/7676.html
* http://www.laozuo.org/5571.html
* https://segmentfault.com/a/1190000004457037
* http://blog.csdn.net/github_26672553/article/details/50997606
