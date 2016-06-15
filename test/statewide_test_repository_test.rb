require_relative 'test_helper'
require_relative '../lib/statewide_test_repository'


class StatewideRepositoryTest < Minitest::Test
  attr_reader :str

  def setup
    @str = StatewideTestRepository.new
    str.load_data({
      :statewide_testing => {
        :third_grade => "./data/3rd grade students scoring proficient or above on the CSAP_TCAP.csv",
        :eighth_grade => "./data/8th grade students scoring proficient or above on the CSAP_TCAP.csv",
        :math => "./data/Average proficiency on the CSAP_TCAP by race_ethnicity_ Math.csv",
        :reading => "./data/Average proficiency on the CSAP_TCAP by race_ethnicity_ Reading.csv",
        :writing => "./data/Average proficiency on the CSAP_TCAP by race_ethnicity_ Writing.csv"
      }
    })
  end

  def test_it_can_find_by_name
    st = str.find_by_name("ACADEMY 20")

    assert_instance_of StatewideTest, st
  end

  def test_it_loads_files
    result = {:math=>0.706, :reading=>0.698, :writing=>0.504}

    assert_equal result, str.statewide_tests["COLORADO"].attributes[:third_grade][2010]
  end
end
