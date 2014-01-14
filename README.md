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
In your controller, include SendZip
```ruby
class DownloadController < ApplicationController
  include SendZip
end
```
then you can use `send_zip` like `send_file`.
```ruby
def download
  send_zip '/path/to/file'
end

Options
--
| Option         | Description                     | Default                    |
|:---------------|:--------------------------------|:---------------------------|
| `:filename`    |Filename                         |File.basename(path) + '.zip'|
| `:type`        |MIME-Type                        |'application/zip'|
| `:disposition` |                                 |'attachment'     |
| `:status`      |Status code                      |'200 OK'|
| `:buffer_size` |                                 |1048576|
| `:encoding`    |Filename encode type             |:utf-8|

Notice
--
WEBrick is not compatible with HTTP Streaming. Use puma, unicorn, thin, etc.
I recommend puma.



