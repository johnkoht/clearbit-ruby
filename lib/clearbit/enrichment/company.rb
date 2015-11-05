module Clearbit
  module Enrichment
    class Company < Base
      endpoint 'https://company.clearbit.com'
      path '/v2/companies'

      def self.find(values)
        unless values.is_a?(Hash)
          values = { domain: values }
        end

        if values.key?(:domain)
          response = get(uri(:find), values)
        else
          raise ArgumentError, 'Invalid values'
        end

        if response.status == 202
          Pending.new
        else
          self.new(response)
        end
      rescue Nestful::ResourceNotFound
      end

      class << self
        alias_method :[], :find
      end

      def flag!(attrs = {})
        self.class.post(uri(:flag), attrs)
      end
    end
  end
end
