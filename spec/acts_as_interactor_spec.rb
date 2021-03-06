require 'spec_helper'

RSpec.describe Interactor::ActsAsInteractor do
  let(:listener)   { Listener.new }
  let(:interactor) { WidgetCreator.new(listener) }

  it "instantiates with listeners" do
    expect(interactor.listeners).to include(listener)
  end

  describe ".broadcast" do
    it "calls the correct message when process is successful" do
      expect(listener).to receive(:widget_creator_success)
      result = interactor.process(true)
      expect(result).to be true
    end

    it "calls the correct message when process is unsuccessful" do
      expect(listener).to receive(:widget_creator_failure)
      result = interactor.process(false)
      expect(result).to be false
    end
  end

  it "raises an error if process is not defined" do
    expect{ InvalidInteractor.new() }.to raise_error NotImplementedError
  end
end
