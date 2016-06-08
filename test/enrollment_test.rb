require './test/test_helper'
require './lib/enrollment'

class EnrollmentTest < Minitest::Test

  def test_kindergarten_participation_by_year
    e = Enrollment.new({:name => "ACADEMY 20", :kindergarten_participation => {2010 => 0.3915, 2011 => 0.35356, 2012 => 0.2677}})
    expected = {  2010 => 0.391,
                  2011 => 0.353,
                  2012 => 0.267,
                }
    assert_equal expected, e.kindergarten_participation_by_year
  end

  def test_kindergarten_participation_in_year
    e = Enrollment.new({:name => "ACADEMY 20", :kindergarten_participation => {2010 => 0.3915, 2011 => 0.35356, 2012 => 0.2677}})
    expected = 0.391
    assert_equal expected, e.kindergarten_participation_in_year(2010)
  end

end
