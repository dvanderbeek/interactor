= Interactor

### Usage

Define an interactor

```ruby
class WidgetCreator < Interactor::Base
  def process(params)
    widget = Widget.new(params)
    success = widget.save
    broadcast(success, widget)
    return success
  end
end
```

Pass some listeners to the interactor. Listeners just need to respond success and failure messages if they are interested
* :widget_creator_success
* :widget_creator_failure

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