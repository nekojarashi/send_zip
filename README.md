send_zip
========
<a href="http://badge.fury.io/rb/send_zip"><img src="https://badge.fury.io/rb/send_zip@2x.png" alt="Gem Version" height="18"></a>

This gem enables Rails(or any Rack based app) to send the files with being zipped dynamically. Features are:

* Downloading starts immediately, so you don't need to wait until files are compeltely zipped. It's nice for downloading large sized files.
* Can zip a file, files, or folder. Zipped folder keeps the directory structure.
* Can set the encoding of file name in the zip. Now only UTF-8 and Shift-JIS are supported.

This gem is based on [zipping](https://github.com/nekojarashi/zipping).


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

You can set an array of files
```ruby
send_zip ['/path/to/file', '/path/to/another']
```
or folder
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
| `:buffer_size` |                                 |1048576|
| `:encoding`    |Filename encoding type. Now :utf8 and :shift_jis|:utf8|

Notice
--
WEBrick is __not__ compatible with HTTP Streaming. Use [Puma](https://github.com/puma/puma), [Unicorn](https://github.com/defunkt/unicorn), thin, etc.
I recommend puma.

Rails Sample
--
Rails4 with Puma.
[Rails sample](https://github.com/nekojarashi/send_zip_rails_sample)




