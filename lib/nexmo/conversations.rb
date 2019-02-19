module Nexmo
    class Conversations < Namespace
        self.authentication = BearerToken

        self.request_body = JSON

        def create(params)
          request('/beta/conversations', params: params, type: Post)
        end

        def list(params = nil)
          request('/beta/conversations', params: params)
        end

        def get(id)
          request('/beta/conversations/' + id)
        end
      
        def update(id, params)
          request('/beta/conversations/' + id, params: params, type: Put)
        end

        def delete(id)
          request('/beta/conversations/' + id, type: Delete)
        end
    end
end

