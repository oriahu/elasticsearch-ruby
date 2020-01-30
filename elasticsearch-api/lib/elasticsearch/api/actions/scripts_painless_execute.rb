# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Actions
      # Allows an arbitrary script to be executed and a result to be returned
      #
      # @option arguments [Hash] :body The script to execute

      #
      # @see https://www.elastic.co/guide/en/elasticsearch/painless/master/painless-execute-api.html
      #
      def scripts_painless_execute(arguments = {})
        arguments = arguments.clone

        method = HTTP_GET
        path   = "_scripts/painless/_execute"
        params = {}

        body = arguments[:body]

        perform_request(method, path, params, body).body
      end

      # Register this action with its valid params when the module is loaded.
      #
      # @since 6.2.0
    end
    end
end
