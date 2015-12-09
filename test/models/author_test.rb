require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  test "the truth" do
    author = Author.create(name: 'alice', birth_date: 30.years.ago)

    p { author.name == 'bob' }

    dummy_author = OpenStruct.new(name: 'alice', birth_date: 30.years.ago)

    p { dummy_author.name == 'bob' }
  end
end
