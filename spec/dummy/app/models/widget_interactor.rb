class WidgetInteractor < Interactor::Base
  def process(success)
    broadcast(success)
  end
end