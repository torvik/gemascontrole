module ApplicationHelper

  def number_to_phone(number, options ={})
    options = options.stringify_keys
    delimiter = options.delete("delimiter") { "-"}
    extension = options.delete("extension") { "" }
    begin
      str = number.to_s
      str = case str.length
      when 11
        str.gsub(/([0-9]{2})([0-9]{5})([0-9]{4})/, "(\\1) \\2#{delimiter}\\3")
      when 10
      str.gsub(/([0-9]{2})([0-9]{4})([0-9]{4})/, "(\\1) \\2#{delimiter}\\3")
    else
      raise "Numero invalido []#{str}]"
    end
    extension.to_s.strip.empty? ? str :
      "#{str} x #{extension.to_s.strip}"
    rescue
      number
    end
  end

  def number_to_cep(number, options ={})
    options = options.stringify_keys
    delimiter = options.delete("delimiter") { "-"}
    extension = options.delete("extension") { "" }
    begin
      str = number.to_s
      str = case str.length
      when 8
        str.gsub(/([0-9]{5})([0-9]{3})/, "\\1#{delimiter}\\2")
    else
      raise "Numero invalido []#{str}]"
    end
    extension.to_s.strip.empty? ? str :
      "#{str} x #{extension.to_s.strip}"
    rescue
      number
    end
  end


end
