# encoding: utf-8
require_relative "./deep_freezable.rb"

class Foot
  extend DeepFreezable
  ANIMALS = { "cow" => 4, "human" => 2, "spider" => 8 }
end
