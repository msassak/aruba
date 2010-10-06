When /^I do aruba (.*)$/ do |aruba_step|
  begin
    When(aruba_step)
  rescue => e
    @aruba_exception = e
  end
end

Then /^aruba should fail with "([^"]*)"$/ do |error_message|
  @aruba_exception.message.should =~ regexp(error_message)
end

Then /^the following step should fail with Spec::Expectations::ExpectationNotMetError:$/ do |multiline_step|
  proc {steps multiline_step}.should raise_error(RSpec::Expectations::ExpectationNotMetError)
end

Then /^the output should be (\d+) bytes long$/ do |length|
  combined_output.chomp.length.should == length.to_i 
end
