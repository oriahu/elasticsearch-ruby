# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Snapshot
      module Actions
        # Returns information about the status of a snapshot.
        #
        # @option arguments [String] :repository A repository name
        # @option arguments [List] :snapshot A comma-separated list of snapshot names

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/modules-snapshots.html
        #
        def status(arguments = {})
          arguments = arguments.clone

          _repository = arguments.delete(:repository)

          _snapshot = arguments.delete(:snapshot)

          method = HTTP_GET
          path   = if _repository && _snapshot
                     "_snapshot/#{Utils.__listify(_repository)}/#{Utils.__listify(_snapshot)}/_status"
                   elsif _repository
                     "_snapshot/#{Utils.__listify(_repository)}/_status"
                   else
                     "_snapshot/_status"
end
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          body = nil

          perform_request(method, path, params, body).body
        end

        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:status, [
          :master_timeout,
          :ignore_unavailable
        ].freeze)
end
      end
  end
end
