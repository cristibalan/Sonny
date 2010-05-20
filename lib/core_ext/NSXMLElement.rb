class NSXMLElement < NSXMLNode
  def method_missing(m, *args, &block)
    missing = m.to_s
    if missing[0] != "_"
      super
    else
      if missing[1] == "_"
        self["@#{missing[2..-1]}"]
      else
        self["#{missing[1..-1]}"]
      end
    end
  end

  def [](name)
    if name[0] == "@"
      if attr = attributeForName(name[1..-1])
        attr.stringValue
      end
    else
      elems = elementsForName(name)
      case elems.length
      when 0
        nil
      when 1
        elem = elems[0]
      else
        elems
      end
    end
  end
end
