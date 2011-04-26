module CandyShop
  class Facade
    class FacadeError < StandardError; end

    class << self
      def method_missing(*args)
        begin
          method_id = args.shift
          facade_name = args.shift

          facade = CandyShop::Facades.const_get(facade_name.classify)
          facade.send(method_id, *args)
        rescue NameError, TypeError, NoMethodError => e
          raise FacadeError, "Wrong facade name: #{facade.inspect}"
        end
      end
    end

  end
end
