require 'spec_helper'
describe SkypeSearch::OutputProcessor do

  let(:output_processor) do
    class Test
      include SkypeSearch::OutputProcessor

    end
    Test.new
  end

  it 'can parse emoticons' do
    message = %{[05/04/2013 09:20:33 PM] John Doe > <ss type="hi">(wave)</ss>}

    output_processor.parse(message).should eq %{[05/04/2013 09:20:33 PM] John Doe > \e[31m(wave)\e[0m}
  end

end
