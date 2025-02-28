defmodule InflexTest do
  use ExUnit.Case

  use Inflex

  test :singularize do
    assert "user" == singularize("users")
    assert "sheep" == singularize("sheep")
    assert "mouse" == singularize("mice")
    assert "child" == singularize("children")

    assert "bus" == singularize("buses")
    assert "database" == singularize("databases")
    assert "shoe" == singularize("shoes")
    assert "zombie" == singularize("zombies")
    assert "virus" == singularize("viri")
    assert "goose" == singularize("geese")
    assert "criterion" == singularize("criteria")
    assert "radius" == singularize("radii")
    assert "class" == singularize("classes")
    assert "woman" == singularize("women")
    assert "seaman" == singularize("seamen")
    assert "man" == singularize("men")
    assert "abdomen" == singularize("abdomens")
    assert "abdomen" == singularize("abdomen")
    assert "specimen" == singularize("specimens")
    assert "specimen" == singularize("specimen")
    assert "louse" == singularize("lice")
    assert "quantum" == singularize("quanta")
    assert "foot" == singularize("feet")
    assert "die" == singularize("dice")
    assert "phenomenon" == singularize("phenomena")
    assert "license" == singularize("licenses")

    assert "bus" == singularize(:buses)
  end

  test :pluralize do
    assert "users" == pluralize("user")
    assert "sheep" == pluralize("sheep")
    assert "mice" == pluralize("mouse")
    assert "children" == pluralize("child")

    assert "buses" == pluralize("bus")
    assert "databases" == pluralize("database")
    assert "shoes" == pluralize("shoe")
    assert "viri" == pluralize("virus")
    assert "geese" == pluralize("goose")
    assert "criteria" == pluralize("criterion")
    assert "radii" == pluralize("radius")
    assert "classes" == pluralize("class")
    assert "women" == pluralize("woman")
    assert "seamen" == pluralize("seaman")
    assert "men" == pluralize("men")
    assert "women" == pluralize("women")
    assert "abdomens" == pluralize("abdomen")
    assert "specimens" == pluralize("specimen")
    assert "lice" == pluralize("louse")
    assert "quanta" == pluralize("quantum")
    assert "feet" == pluralize("foot")
    assert "dice" == pluralize("die")
    assert "phenomena" == pluralize("phenomenon")

    assert "buses" == pluralize(:bus)
  end

  test :special_case_nouns_ending_in_o do
    assert "echo" == singularize("echoes")
    assert "hero" == singularize("heroes")
    assert "potato" == singularize("potatoes")
    assert "tomato" == singularize("tomatoes")
    assert "tooth" == singularize("teeth")

    assert "echoes" == pluralize("echo")
    assert "heroes" == pluralize("hero")
    assert "potatoes" == pluralize("potato")
    assert "tomatoes" == pluralize("tomato")
    assert "teeth" == pluralize("tooth")
  end

  test :skip_singularize do
    assert "dog" == singularize("dog")
  end

  test :skip_pluralize do
    assert "dogs" == pluralize("dogs")
  end

  test :camelize_upper do
    assert "Upper"          == camelize("upper")
    assert "UpperCamelCase" == camelize("upper_camel_case")
    assert "UpperCamelCase" == camelize("UpperCamelCase")
    refute "UpperCamelCase" == camelize("upper_camel_case", :lower)
  end

  test :camelize_lower do
    assert "lower"          == camelize("lower", :lower)
    assert "lowerCamelCase" == camelize("lower_camel_case", :lower)
    assert "lowerCamelCase" == camelize("Lower_camel_case", :lower)
    assert "lowerCamelCase" == camelize("lowerCamelCase", :lower)
    refute "lowerCamelCase" == camelize("lower_camel_case")
  end

  test :parameterize do
    assert "elixir-inflex" == parameterize("elixir inflex")
    assert "elixir-inflex" == parameterize("Elixir Inflex")
    assert "elixir_inflex" == parameterize("elixir inflex", "_")
    assert "elixir-inflex" == parameterize("elixir%20inflex")
  end

  test :underscore do
    assert "upper_camel_case" == underscore("UpperCamelCase")
    assert "lower_camel_case" == underscore("lowerCamelCase")
    assert "upper_camel_case" == underscore(UpperCamelCase)
    assert "lower_camel_case" == underscore(:lowerCamelCase)
    assert "elixir_inflex" == underscore("elixir-inflex")
    assert "elixir_inflex" == underscore("Elixir-Inflex")
  end

  test :inflect do
    assert "child" == inflect("children", 1)
    assert "people" == inflect("person", 2)
    assert "dogs" == inflect("dog", 3.2)
  end

end
