# encoding: utf-8
# ===
# === 9.2.3 例外処理の流れ

# わかりきってるが一応サンプルコード作成

# method1→method2→method3の順で呼び出す
def method1
  puts "Start method1"
  begin
    method2
  rescue
    puts "例外が発生"
  end
  puts "End method1"
end

def method2
  puts "Start method2"
  method3
  # method3で例外が発生するので、これより下は実行されない
  puts "End method2"
end

def method3
  puts "Start method3"
  # 意図的に例外を発生させる
  not_exists_method
  # 上記の処理で例外が発生するので、これより下は実行されない
  puts "End method3"
end

method1
#=>
# Start method1
# Start method2
# Start method3
# 例外が発生
# End method1
