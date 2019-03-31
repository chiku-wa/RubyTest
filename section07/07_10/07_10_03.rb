#encoding: utf-8
# ===
# === 7.10.3 ネストしたクラスの定義
class User
  class BloodType
    attr_reader :type

    def initialize(type)
      @type = type
    end
  end
end

blood_type = User::BloodType.new("AB")
puts blood_type.type #=> AB

# ===
# === Column
# クラスにpublicやprivateといった修飾は不可能、強制的にpublicとなる

# public class User
# end
#=> nil is not a symbol nor a string (TypeError)

# private class BloodType
# end
#=>  `private': nil is not a symbol nor a string (TypeError)
