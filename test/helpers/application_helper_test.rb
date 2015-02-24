require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "display poll title" do
    poll = Fabricate(:poll, title: "Foo", author: "Bar")
    assert_equal("Foo - Bar", poll_title(poll))
  end
end
