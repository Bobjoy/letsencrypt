#!/bin/bash
git clone https://github.com/letsencrypt/letsencrypt
cd letsencrypt
./letsencrypt-auto certonly --standalone --email bobjoy1010@qq.com -d bflyer.com -d www.bflyer.com -d blog.bflyer.com
