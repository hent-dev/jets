class Jets::Resource::ApiGateway::RestApi::LogicalId
  class Message
    def routes_changed
      <<~EOL
      Routes Change Detection: Jets has detected that a new brand API Gateway is required to be deployed.
      IMPORTANT: This will result in the API Gateway endpoint changing.
      EOL
    end

    def custom_domain
      domain_name = Jets.config.domain.name
      if domain_name
        <<~EOL
        It looks like you have already set up a custom domain.
        The domain name: #{domain_name}

        So you should be good to go as the custom domain will be updated with the new API Gateway endpoint.
        To avoid this prompt in the future, you can configure:

        config/application.rb

            config.api.auto_replace = true

        More info: custom domain docs: https://rubyonjets.com/docs/routing/custom-domain/
        EOL
      else
        <<~EOL
        To avoid this prompt in the future, you can configure:

        config/application.rb

            config.api.auto_replace = true

        However, you should also set up a custom domain for a "stable" endpoint.

        https://rubyonjets.com/docs/routing/custom-domain/

        EOL
      end
    end

    def auto_replace_disabled
      <<~EOL
      It looks like `config.api.auto_replace = false`. IE:

      config/application.rb

          config.api.auto_replace = false

      The deploy will not continue. See:

      * https://rubyonjets.com/docs/app-config/reference/
      * https://rubyonjets.com/docs/routing/custom-domain/

      EOL
    end
  end
end

