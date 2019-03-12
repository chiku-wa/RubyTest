  zip_code_double = "郵便番号は999-9999と888-8888です"
  p zip_code_double[/\d{3}-\d{4}/] #=> 999-9999
  p zip_code_double[/\d{3}-\d{4}/, 2] #=> nil
