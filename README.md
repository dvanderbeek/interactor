# Interactor

### Usage

Define an interactor by calling `acts_as_interactor` and defining the method `process`. Use the `broadcast` method to tell the interactor's listeners what happened, along with any arguments.

```ruby
class WidgetCreator
  acts_as_interactor

  def process(params)
    widget = Widget.new(params)
    success = widget.save
    broadcast(success, widget)
    return success
  end
end
```

Pass some listeners to the interactor. Listeners just need to respond success and failure messages if they are interested. In this case, `:widget_creator_success` and `:widget_creator_failure`

```ruby
class WidgetController
  def create
    WidgetCreator.new(self, FeedWriter.new, Mailer.new).process(widget_params)
  end

  def widget_creator_success(widget)
    redirect_to Widget, notice: 'Your widget was created successfully.'
  end

  def widget_creator_failure(widget)
    render :new
  end
end
```

This project rocks and uses MIT-LICENSE.
