module Bankin
  ###########################################################################
  # MODULE BANKIN::CLIENT::
  # Module de création de data client
  module Client

    def self.nb_params(params)
      i = 0
      nb = 0
      while i != params.length
        if params[i] != nil
          nb += 1
        end
        i += 1
      end
      return nb
    end

    #########################################################################
    # MODULE BANKIN::CLIENT::GET
    # Module de création de data pour la méthode Get
    module Get
      def self.create_data_client(route, nb_params, params, client_id, client_secret)
        case route
        when "/users"
          hash_params = {
            "before" => params[0].to_s,
            "after" => params[1].to_s,
            "limit" => params[2].to_s
          }
        when "/banks"
          hash_params = {
            "before" => params[0].to_s,
            "after" => params[1].to_s,
            "limit" => params[2].to_s
          }
        when "/accounts"
          hash_params = {
            "token" => params[0].to_s,
            "before" => params[1].to_s,
            "after" => params[2].to_s,
            "limit" => params[3].to_s
          }
        when "/accounts/:id"
          hash_params = {
            "token" => params[0].to_s,
            "account_id" =>params[1].to_s
          }
        end

        return Bankin::Error.request_params(data = {
          "client_id" => client_id,
          "client_secret" => client_secret,
          "method" => "GET",
          "route" => route,
          "nb_params" => nb_params,
          "client_infos" => hash_params
        })
      # END CREATE_DATA_CLIENT(route, nb_params, params)
      end

    ###########################################################################
    # END MODULE BANKIN::CLIENT::GET
    end

    #########################################################################
    # MODULE BANKIN::CLIENT::POST
    # Module de création de data pour les méthodes Post
    module Post
      def self.create_data_client(route, nb_params, params, client_id, client_secret)
        case route

        when "/users"
            hash_params = {
              "email" => params[0].to_s,
              "password" => params[1].to_s
            }
        when "/authenticate"
          hash_params = {
            "email" => params[0].to_s,
            "password" => params[1].to_s
          }
        when "/logout"
          hash_params = {
            "token" => params[0].to_s
          }
        end

        return Bankin::Error.request_params({
          "client_id" => client_id,
          "client_secret" => client_secret,
          "method" => "POST",
          "route" => route,
          "nb_params" => nb_params,
          "client_infos" => hash_params
        })
      end

    ##########################################################################
    # END MODULE BANKIN::CLIENT::POST
    end

    #########################################################################
    # MODULE BANKIN::CLIENT::DELETE
    # Module de création de data pour les méthods Delete
    module Delete
      def self.create_data_client(route, nb_params, params, client_id, client_secret)
        case route
        when "/users"
          if (nb_params > 0)
            hash_params = {
              "uuid" => params[0].to_s,
              "password" => params[1].to_s
            }
          else hash_params = {}
          end
        end

        return Bankin::Error.request_params({
          "client_id" => client_id,
          "client_secret" => client_secret,
          "method" => "DELETE",
          "route" => route,
          "nb_params" => nb_params,
          "client_infos" => hash_params
        })
      # END CREATE_DATA_CLIENT(*params)
      end

    ##########################################################################
    # END MODULE BANKIN::CLIENT::DELETE
    end

    #########################################################################
    # MODULE BANKIN::CLIENT::PUT
    # Module de création de data pour les méthods Put
    module Put
      def self.create_data_client(route, nb_params, params, client_id, client_secret)
        case route
        when "/password"
          hash_params = {
            "current_password" => params[0].to_s,
            "new_password" => params[1].to_s,
            "uuid" => params[2].to_s
          }
        end

        return Bankin::Error.request_params({
          "client_id" => client_id,
          "client_secret" => client_secret,
          "method" => "DELETE",
          "route" => route,
          "nb_params" => nb_params,
          "client_infos" => hash_params
        })
      # END CREATE_DATA_CLIENT(*params)
      end

    ##########################################################################
    # END MODULE BANKIN::CLIENT::PUT
    end

  ###########################################################################
  # END MODULE BANKIN::CLIENT
  end

############################################################################
# END MODULE BANKIN::
end
