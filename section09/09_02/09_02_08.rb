# encoding: utf-8
# ===
# === 9.2.8 例外発生時にもう一度処理をやり直すretry

# retryで、例外発生時にbegin節に処理を戻す

# retryの回数を制限するため、カウンタを設定する
retry_count = 0
RETRY_LIMIT = 3.freeze

begin
  puts "Start"

  # 意図的に例外を発生させる
  "Tom".no_exists_method

  puts "End"
rescue
  retry_count += 1

  if retry_count > RETRY_LIMIT
    puts "リトライ回数が規定回数を上回りました。"
  else
    puts "リトライします。 回数:#{retry_count}"
    retry
  end
end
#=>
# Start
# リトライします。 回数:1
# Start
# リトライします。 回数:2
# Start
# リトライします。 回数:3
# Start
# リトライ回数が規定回数を上回りました。
