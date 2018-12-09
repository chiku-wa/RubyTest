# ====================
# 3.2.2 本書で使用するMinitestの検証メソッド
# ====================
def assert_type_test
  a = "123"
  b = "456"

  # aとbが等しければパスする
  assert_equal b, a

  # aが真であればパスする
  assert a

  # aが偽であればパスする
  refute a
end

def arr_test
  test_cases = {
    "1": 1,
    "2": 2,
  }

  test_cases.each { |key, value|
    print key
  }
end

arr_test
