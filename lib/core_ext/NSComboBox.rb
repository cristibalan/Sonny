# Use Accessibility API to automatically open the results
# http://www.mail-archive.com/cocoa-dev@lists.apple.com/msg13021.html
class NSComboBox
  def expanded
    ax = NSAccessibilityUnignoredDescendant(self);
    return ax.accessibilityAttributeValue(NSAccessibilityExpandedAttribute).boolValue
  end

  def expanded=(expanded)
    ax = NSAccessibilityUnignoredDescendant(self);
    ax.accessibilitySetValue(expanded, forAttribute:NSAccessibilityExpandedAttribute)
  end
end

# Alternatively, it could be faked with a keypress
# http://discussions.info.apple.com/message.jspa?messageID=11439675#11439675
#  XXX fails when starting with a capital letter because shift+down doesn't open combobox
#  def forceComboboxOpen
#    event1 = CGEventCreateKeyboardEvent(nil, 125, true);
#    event2 = CGEventCreateKeyboardEvent(nil, 125, false);
#    CGEventPost(0, event1);
#    CGEventPost(0, event2);
#  end
