require 'spec_helper'
describe SkypeSearch::OutputProcessor do

  it 'can parse emoticons' do
    message = %{[05/04/2013 09:20:33 PM] John Doe > <ss type="hi">(wave)</ss>}
    processor = SkypeSearch::OutputProcessor.new(message).parse

    processor.output.should eq %{[05/04/2013 09:20:33 PM] John Doe > \e[31m(wave)\e[0m}
  end

  it 'can parse multiple emoticons' do
    message = %{[05/04/2013 09:20:33 PM] John Doe > <ss type="hi">(wave)</ss> <ss type="smile">:)</ss>}
    processor = SkypeSearch::OutputProcessor.new(message).parse

    processor.output.should eq %{[05/04/2013 09:20:33 PM] John Doe > \e[31m(wave)\e[0m \e[31m:)\e[0m}
  end

end
