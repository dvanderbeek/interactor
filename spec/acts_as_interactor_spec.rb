require 'spec_helper'

RSpec.describe Interactor::ActsAsInteractor do
  let(:listener) { Listener.new }
  let(:interactor) { WidgetInteractor.new(listener) }

  it "instantiates with listeners" do
    expect(interactor.listeners).to include(listener)
  end

  describe ".message" do
    it "generates the correct success message" do
      expect(interactor.message(true)).to eq :widget_interactor_success
    end

    it "generates the correct failure message" do
      expect(interactor.message(false)).to eq :widget_interactor_failure
    end
  end

  describe ".broadcast" do
    it "calls the correct message when process is successful" do
      expect(listener).to receive(:widget_interactor_success)
      interactor.process(true)
    end


    it "calls the correct message when process is unsuccessful" do
      expect(listener).to receive(:widget_interactor_failure)
      interactor.process(false)
    end
  end
end