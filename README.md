send_zip
========

This gem adds the feature of downloading the files with being zipped dynamically in Rails(or any Rack framework).

This gem uses [zipping](https://github.com/nekojarashi/zipping).

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

  ...
end
```

then you can use `send_zip` with the argument of file path. 
```ruby
def download
  send_zip '/path/to/file'
end
```

You can set array of files
```ruby
send_zip ['/path/to/file', '/path/to/another']
```
or even folder
```ruby
send_zip '/path/to/folder'
```

Options
--

Some options are available like `send_file`.
```ruby
send_zip '/path/to/file', filename: 'foo.zip', buffer_size: 1024
```

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
WEBrick is __not__ compatible with HTTP Streaming. Use puma, unicorn, thin, etc.
I recommend puma.



