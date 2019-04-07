# encoding: utf-8
require_relative "./deep_freezable.rb"

class DVD
  # クラス直下の定数に対してモジュールのメソッドを使うため、includeではなくextendにする
  extend DeepFreezable

  MOVIES = deep_freeze(["Pacific Rim", "Toy Story3", "Monsters Inc"])
end
