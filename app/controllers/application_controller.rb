require 'json'

class ApplicationController
  attr_writer :statusMenu

  def awakeFromNib
    @status_bar_item = NSStatusBar.systemStatusBar.statusItemWithLength(NSVariableStatusItemLength)
    @status_bar_item.menu = @statusMenu
    @status_bar_item.title = "..."
    @status_bar_item.highlightMode = true

    # results = Geoname.search('mendoza')
    # first = results.first

    # yr = Yr.forecast(first.forecast_url)
    # p yr._links._link[2].__url
  end

  def applicationDidFinishLaunching(sender)
    showPreferences(nil)
  end

  def preferencesController
    @preferencesController ||= PreferencesController.alloc.init
  end

  def showPreferences(sender)
    preferencesController.showWindow(self)
  end

  private
    
  def add_observers
    center = NSNotificationCenter.defaultCenter
    center.addObserver(self, selector: :"handleLocationChanged:",
                        name: PreferencesController::LocationChangedNotification,
                        object: nil)
  end

  def updateMenu
    @menu.addItemWithTitle("mmmpie", action:"wtfz", keyEquivalent: "")
  end
end
