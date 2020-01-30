# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Cat
      module Actions
        # Returns information about index shard recoveries, both on-going completed.
        #
        # @option arguments [List] :index Comma-separated list or wildcard expression of index names to limit the returned information

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/cat-recovery.html
        #
        def recovery(arguments = {})
          arguments = arguments.clone

          _index = arguments.delete(:index)

          method = HTTP_GET
          path   = if _index
                     "_cat/recovery/#{Utils.__listify(_index)}"
                   else
                     "_cat/recovery"
end
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          params[:h] = Utils.__listify(params[:h]) if params[:h]

          body = nil

          perform_request(method, path, params, body).body
        end

        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:recovery, [
          :format,
          :active_only,
          :bytes,
          :detailed,
          :h,
          :help,
          :index,
          :s,
          :time,
          :v
        ].freeze)
end
      end
  end
end
