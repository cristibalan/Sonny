class PreferencesController < NSWindowController
  attr_accessor :resultsArray
  attr_accessor :searchField
  attr_accessor :label

  def init
    @resultsArray = []
    self if super.initWithWindowNibName("Preferences")
  end

  def awakeFromNib
  end

  def numberOfItemsInComboBox(combobox)
    @resultsArray.length
  end

  def comboBox(combobox, objectValueForItemAtIndex: index)
    @resultsArray[index]
  end

  # cool, but not using it atm
  def comboBox(combobox, completedString:completedString)
    completedString = completedString.downcase
    @resultsArray.find{|x| x.downcase.include? completedString}
  end

  def controlTextDidChange(notification)
    combobox = notification.object
    combobox.scrollItemAtIndexToVisible(0)
    @resultsArray = Geoname.search(combobox.stringValue).map{|x|x["description"]}
    combobox.reloadData
    combobox.expanded = true
  end

  def controlTextDidEndEditing(notification)
    combobox = notification.object
    combobox.expanded = false
    yr = Yr.forecast("!!!")
    time_period = yr._forecast._tabular._time[2]
    forecast = "#{time_period._temperature.__value}C (#{time_period._symbol.__name})"
    label.stringValue = forecast
  end
end
