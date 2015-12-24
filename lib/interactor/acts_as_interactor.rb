module Interactor
  module ActsAsInteractor
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def acts_as_interactor
        attr_reader :listeners
        include Interactor::ActsAsInteractor::LocalInstanceMethods
      end
    end

    module LocalInstanceMethods
      def initialize(*listeners)
        @listeners = listeners
      end

      def broadcast(success, *args)
        listeners.each do |listener|
          listener.send(message(success), *args) if listener.respond_to? message(success)
        end
      end

      def message(success)
        "#{self.class.name.underscore}_#{success ? 'success' : 'failure'}".to_sym
      end
    end
  end
end
