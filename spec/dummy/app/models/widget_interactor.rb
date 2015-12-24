class WidgetInteractor < BaseInteractor
  def process(success)
    broadcast(success)
  end
end