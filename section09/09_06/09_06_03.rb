#encoding: utf-8
# ===
# === 9.6.3 例外処理のelse

def read_from_file(file_path)
  begin
    puts "[begin]"

    file = open(file_path, "r")
    file.each { |f| puts f }
  rescue => e
    # 例外の補足処理
    puts "[resucue]"
    puts "例外発生：#{e.class} #{e.message}"
  else
    # 例外が発生しなかった場合の処理
    puts "[else]"
  ensure
    # 例外の有無にかかわらず発生する処理
    puts "[ensure]"
    if file
      file.close
    end
  end
end

# 例外が発生しない場合
read_from_file("./test_09_06_03.txt")
#=>
# [begin]
# One
# Two
# Three
# [else]
# [ensure]

puts "================="

# 例外が発生した場合
read_from_file("./not_exists_file.txt")
# [begin]
# [resucue]
# 例外発生：Errno::ENOENT No such file or directory @ rb_sysopen - ./not_exists_file.txt
# [ensure]
