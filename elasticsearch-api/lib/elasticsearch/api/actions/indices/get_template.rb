# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Indices
      module Actions
        # Returns an index template.
        #
        # @option arguments [List] :name The comma separated names of the index templates

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-templates.html
        #
        def get_template(arguments = {})
          arguments = arguments.clone

          _name = arguments.delete(:name)

          method = HTTP_GET
          path   = if _name
                     "_template/#{Utils.__listify(_name)}"
                   else
                     "_template"
end
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          body = nil

          perform_request(method, path, params, body).body
        end

        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:get_template, [
          :include_type_name,
          :flat_settings,
          :master_timeout,
          :local
        ].freeze)
end
      end
  end
end
