require 'test_helper'

class Concerns::HasSluggedTitleTest < ActiveSupport::TestCase
  test 'the concern extends FriendlyId' do
    ex_klass = Class.new(ActiveRecord::Base)
    assert_not ex_klass.included_modules.include? HasSluggedTitle
    ex_klass.send(:include, HasSluggedTitle)
    assert ex_klass.included_modules.include? HasSluggedTitle
  end

  test 'the concern adds a method #should_generate_new_friendly_id?' do
    ex_klass = Class.new(ActiveRecord::Base)
    assert_not ex_klass.instance_methods.include? :should_generate_new_friendly_id?
    ex_klass.send(:include, HasSluggedTitle)
    assert ex_klass.instance_methods.include? :should_generate_new_friendly_id?
  end
end
