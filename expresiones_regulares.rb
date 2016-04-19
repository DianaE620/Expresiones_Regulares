

def number_count?(string)
 
 case string

  when /\A\d{4}-\d{3}-\d{3}\z/       then true #  \A Inicio del string / 4 digitos - 3 digitos - 3digitos/ \z final del string
  when /\s\d{4}\-\d{3}-\d{3}\z/      then true #  \s Cualquier caracter en blanco / 4 digitos - 3 digitos - 3 digitos / \z final de string
  when /\A\d{4}\-\d{3}-\d{3}\s/      then true #  \A Inicio del string / 4 digitos - 3 digitos - 3 digitos / \s Cualquier caracter en blanco
  when /\s\d{4}\-\d{3}-\d{3}\s/      then true #  \s Cualquier caracter en blanco / 4 digitos - 3 digitos - 3 digitos / \s Cualquier caracter en blanco 
  when /\D\d{4}\-\d{3}-\d{3}\D/      then true #  \D Cualquiera no digito / 4 digitos - 3 digitos - 3 digitos / \D Cualquiera no digito
  else
    false
  end

end

p number_count?("1234-123-123")
p number_count?("  1234-123-123")
p number_count?("1234-123-123   ")
p number_count?("   1234-123-123   ")
p number_count?("lala1234-123-123lala")
p number_count?("lakdmnjaslala   1234-123-123lala   ")

def count_exist(string)
  if number_count?(string)
    /\d{4}\-\d{3}-\d{3}/.match(string).to_s
  else
    nil
  end
end

p count_exist("lalala1234-123-123lalala")
p count_exist("1234-123-123   ")
p count_exist("lakdmnjaslala   1234-123-123lala   ")
p count_exist("lakdmnjaslala   12534-123-12d3lala   ")

def count_array(string)
  array_count = []

  if number_count?(string)
    array_count << /\d{4}\-\d{3}-\d{3}/.match(string).to_s
  else
    array_count
  end

end

p count_array("lalala1234-123-123lalala")
p count_array("1234-123-123   ")
p count_array("lakdmnjaslala   1234-123-123lala   ")
p count_array("lakdmnjaslala   12534-123-12d3lala   ")

def secret_count(string)

  if number_count?(string)
    string.gsub(/\d{4}\-\d{3}/, "XXXX-XXX")
  else
    puts "number count not find"
  end

end

p secret_count("lalala1234-123-123lalala")
p secret_count("1234-123-123   ")
p secret_count("lakdmnjaslala   1234-123-123lala   ")
p secret_count("lakdmnjaslala   12534-123-12d3lala   ")

def format_count(string)

  if string =~ /\A\d{4}\d{3}\d{3}\z/
    string.insert(4, "-")
    string.insert(8, "-")
  elsif string =~ /\A\d{4}\D\d{3}\D\d{3}\z/ 
    a = string
    a.gsub(/\D/, "-")
  else
    "number count not find"
  end

  
end

p format_count("1230.948.209")
p format_count("2220940184")
p format_count("8882058294935")












