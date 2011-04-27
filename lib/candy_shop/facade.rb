module CandyShop
  class Facade
    class FacadeError < StandardError; end

    class << self
      def method_missing(*args)
        begin
          method_id = args.shift
          facade_name = args.shift + "_facade"

          facade = CandyShop::Facades.const_get(facade_name.classify).new
          facade.send(method_id, *args) if facade.respond_to?(method_id)
        rescue NameError, TypeError, NoMethodError => e
          raise FacadeError, "Wrong facade name: #{facade.inspect}"
        rescue ArgumentError => e
          raise FacadeError, "Arguments Error: #{e.to_s}"
        end
      end
    end

  end
end
