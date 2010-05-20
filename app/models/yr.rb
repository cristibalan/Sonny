class Yr
  # Forecast from yr.no
  # Weather forecast from yr.no, Delivered by the Norwegian Meteorological Institute and the Norwegian Broadcasting Corporation
  # http://api.yr.no/weatherapi/documentation
  # http://translate.googleusercontent.com/translate_c?hl=en&sl=no&tl=en&u=http://www.yr.no/informasjon/1.1940495&rurl=translate.google.com&twu=1&usg=ALkJrhjEU39_jzE7knhvQURPec2q5UsCyw
  # http://www.yr.no/informasjon/1.1940495
  def self.forecast(url)
    url = "file://localhost/Users/chelu/work/me/macrubyhax/Sonny/test/fixtures/forecast.xml"
    url = NSURL.URLWithString(url)
    content = NSMutableString.alloc.initWithContentsOfURL(url, encoding:NSUTF8StringEncoding, error:nil)

    data = content.dataUsingEncoding(NSUTF8StringEncoding)
    document = NSXMLDocument.alloc.initWithData(data, options:NSXMLDocumentTidyXML, error:nil)
    root = document.rootElement
  end

  def initialize(root)
    @root = root
  end
end
