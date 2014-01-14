send_zip
========

This gem adds the feature of downloading the files with being zipped dynamically on Rails(or any Rack framework).

This gem uses [zipping gem](https://github.com/nekojarashi/zipping).

Getting Started
--
Add the following line to your Gemfile:

    gem 'send_zip'

Usage
--



Options
--
| Option       | Description | Default      |
|:-------------|:------------|:------------:|
| :filename    |Filename     |File.basename(path) + '.zip'|
| :type        |MIME-Type    |'application/octet-stream'|
| :dispotision |             |'attachment'     |
| :status      |Status code|'200 OK'|
| :buffer_size ||1048576|
| :encoding |Filename encode type|:utf-8|




