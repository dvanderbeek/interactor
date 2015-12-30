module Interactor
  module ActsAsInteractor
    def self.included(base)
      base.extend(Interactor::ActsAsInteractor::ClassMethods)
    end

    module ClassMethods
      def acts_as_interactor
        attr_reader :listeners
        include Interactor::ActsAsInteractor::LocalInstanceMethods
      end
    end

    module LocalInstanceMethods
      def initialize(*listeners)
        raise NotImplementedError unless self.respond_to? :process
        @listeners = listeners
      end

      def broadcast(success, *args)
        listeners.each do |listener|
          listener.send(message(success), *args) if listener.respond_to? message(success)
        end
        return success
      end

      def message(success)
        "#{self.class.name.underscore}_#{success ? 'success' : 'failure'}".to_sym
      end
    end
  end
end

Object.send :include, Interactor::ActsAsInteractor
