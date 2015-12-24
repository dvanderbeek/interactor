require 'spec_helper'

class Listener; end;

class WidgetCreator
  acts_as_interactor

  def process(success)
    broadcast(success)
  end
end

class InvalidInteractor
  acts_as_interactor
end

RSpec.describe Interactor::ActsAsInteractor do
  let(:listener) { Listener.new }
  let(:interactor) { WidgetCreator.new(listener) }

  it "instantiates with listeners" do
    expect(interactor.listeners).to include(listener)
  end

  describe ".message" do
    it "generates the correct success message" do
      expect(interactor.message(true)).to eq :widget_creator_success
    end

    it "generates the correct failure message" do
      expect(interactor.message(false)).to eq :widget_creator_failure
    end
  end

  describe ".broadcast" do
    it "calls the correct message when process is successful" do
      expect(listener).to receive(:widget_creator_success)
      interactor.process(true)
    end


    it "calls the correct message when process is unsuccessful" do
      expect(listener).to receive(:widget_creator_failure)
      interactor.process(false)
    end
  end

  it "raises an error if process is not defined" do
    expect{ InvalidInteractor.new() }.to raise_error NotImplementedError
  end
end