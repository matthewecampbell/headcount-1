require_relative 'test_helper'
require_relative '../lib/district_repository'
require_relative '../lib/district'
require_relative '../lib/enrollment'

class DistrictRepositoryTest < Minitest::Test

  def test_it_loads_data_by_length
    dr = DistrictRepository.new
    dr.load_data({
        :enrollment => {
          :kindergarten => "./data/Kindergartners in full-day program.csv",
          :high_school_graduation => "./data/High school graduation rates.csv"
          }
        })
    district = dr.find_by_name("ACADEMY 20")
    assert_instance_of District, district
  end

  def test_it_can_find_by_name
    d1 = District.new({:name => "Adams"})
    d2 = District.new({:name => "ACADEMY 20"})
    dr = DistrictRepository.new({"Adams" => d1, "ACADEMY 20" => d2})

    assert_equal d1, dr.find_by_name("Adams")
    assert_equal d2, dr.find_by_name("ACADEMY 20")
  end

  def test_find_by_name_returns_nil
    d1 = District.new({:name => "Adams"})
    d2 = District.new({:name => "ACADEMY 20"})
    dr = DistrictRepository.new({"Adams" => d1, "ACADEMY 20" => d2})

    assert_equal nil, dr.find_by_name("Not_a_name")
  end

  def test_find_by_name_by_fragment
    d1 = District.new({:name => "Adams"})
    d2 = District.new({:name => "ACADEMY 20"})
    dr = DistrictRepository.new({"Adams" => d1, "ACADEMY 20" => d2})

    assert_equal [d1, d2], dr.find_all_matching("A")
  end

end