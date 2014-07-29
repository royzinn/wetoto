module TotoFormHelper
  def verify_check(index, match)
    match.suggested_results.include?(index) ? true : false
  end
end
