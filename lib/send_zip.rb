require 'send_zip/version'
require 'zipping'

module SendZip
  def send_zip(path, options = {})
    filename = options[:filename] || File.basename(path) + '.zip'
    type = options[:type] || 'application/zip'
    disposition = options[:disposition] == 'inline' ? 'inline' : 'attachment'
    buffer_size = options[:buffer_size] || 1048576
    encoding = options[:encoding] == :shift_jis ? :shif_jis : :utf8

    headers["Content-Type"] = type
    headers["Content-Disposition"] = disposition + '; filename=' + filename
    headers["Transfer-Encoding"] = "chunked"
    headers["Cache-Control"] ||= "no-cache"

    self.response_body = Rack::Chunked::Body.new(
      Enumerator.new { |o|
        Zipping.files_to_zip(o, path, buffer_size, encoding)
      }
    )
  end
end