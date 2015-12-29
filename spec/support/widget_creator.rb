class WidgetCreator
  acts_as_interactor

  def process(success)
    broadcast(success)
  end
end
