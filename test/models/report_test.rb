# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @alice = users(:alice)
    @bob = users(:bob)
    @report = reports(:one)
  end

  test '#created_on' do
    travel_to Time.zone.local(2021, 10, 21) do
      assert_equal '2021/10/21'.to_date, @report.created_on
    end
  end

  test '#editable?' do
    assert_equal false, @report.editable?(@bob)
    assert_equal true, @report.editable?(@alice)
  end
end
