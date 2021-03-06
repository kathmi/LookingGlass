module DocFormat
  # Replaces newlines with br
  def format_text(text)
    text.gsub("\n", "<br />")
  end

  # Wraps field name in tags and gets doc text for showing in doc   
  def prepareField(field, doc)
    outstr = ''
    if field["Display Type"] == "Picture"
      outstr += image_tag(doc[field["Field Name"]], :class => "picture")
    else
      outstr += '<strong>'+field["Human Readable Name"]+': </strong>'
      if field["Truncate"] != nil
        outstr += raw format_text(doc[field["Field Name"]]) if doc[field["Field Name"]]
      elsif field["Display Type"] == "Link"
        this_url = doc[field["Field Name"]].to_s
        outstr += link_to this_url, this_url, target: "_blank"
      else
        outstr += doc[field["Field Name"]].to_s
      end
    end
  end
end
