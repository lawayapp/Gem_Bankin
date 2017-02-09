module Bankin
  ###########################################################################
  # MODULE BANKIN::CLIENT::
  # Module de création de data client
  module Client

    def self.nb_params(params)
      i = 0
      nb = 0
      while i != params.length
        unless params[i].nil?
          nb += 1
        end
        i += 1
      end
      nb
    end

    #########################################################################
    # MODULE BANKIN::CLIENT::GET
    # Module de création de data pour la méthode Get
    module Get
      def self.create_data_client(route, nb_params, params, client_id, client_secret)

        case route
        when '/users'
          hash_params = {
            'before' => params[0].to_s,
            'after' => params[1].to_s,
            'limit' => params[2].to_s
          }
        when '/banks'
          hash_params = {
            'before' => params[0].to_s,
            'after' => params[1].to_s,
            'limit' => params[2].to_s
          }
        when '/accounts'
          hash_params = {
            'before' => params[1].to_s,
            'after' => params[2].to_s,
            'limit' => params[3].to_s
          }
        when '/accounts/:id'
          hash_params = {
            'account_id' => params[1].to_s
          }
        when '/banks/:id'
          hash_params = {
            'bank_id' => params[0].to_s
          }
        when '/items'
          hash_params = {
            'before' => params[1].to_s,
            'after' => params[2].to_s,
            'limit' => params[3].to_s
          }
        when '/items/:id'
          hash_params = {
            'item_id' => params[1].to_s
          }
        when '/items/:id/refresh'
          hash_params = {
            'item_id' => params[1].to_s
          }
        when '/transactions'
          hash_params = {
            'before' => params[1].to_s,
            'after' => params[2].to_s,
            'limit' => params[3].to_s,
            'since' => params[4].to_s,
            'until' => params[5].to_s
          }
        when '/transactions/updated'
          hash_params = {
            'before' => params[1].to_s,
            'after' => params[2].to_s,
            'limit' => params[3].to_s,
            'since' => params[4].to_s
          }
        when '/transactions/:id'
          hash_params = {
            'transaction_id' => params[1].to_s
          }
        when '/stocks'
          hash_params = {
            'before' => params[1].to_s,
            'after' => params[2].to_s,
            'limit' => params[3].to_s
          }
        when '/stocks/updated'
          hash_params = {
            'before' => params[1].to_s,
            'after' => params[2].to_s,
            'limit' => params[3].to_s,
            'since' => params[4].to_s
          }
        when '/stocks/:id'
          hash_params = {
            'stock_id' => params[1].to_s
          }
        when '/categories'
          hash_params = {
            'before' => params[0].to_s,
            'after' => params[1].to_s,
            'limit' => params[2].to_s
          }
        when '/categories/:id'
          hash_params = {
            'categorie_id' => params[0].to_s
          }
        end

        Bankin::Error.request_params(data = {
          'client_id' => client_id,
          'client_secret' => client_secret,
          'method' => 'GET',
          'route' => route,
          'nb_params' => nb_params,
          'client_infos' => hash_params
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
        when '/users'
            hash_params = {
              'email' => params[0].to_s,
              'password' => params[1].to_s
            }
        when '/authenticate'
          hash_params = {
            'email' => params[0].to_s,
            'password' => params[1].to_s
          }
        when '/logout'
          hash_params = {
            'token' => params[0].to_s
          }
        when '/items/:id/refresh'
          hash_params = {
            'token' => params[0].to_s,
            'item_id' => params[1].to_s
          }
        when '/items/:id/mfa'
          hash_params = {
            'token' => params[0].to_s,
            'item_id' => params[1].to_s,
            'otp' => params[2].to_s
          }
        end

        Bankin::Error.request_params({
          'client_id' => client_id,
          'client_secret' => client_secret,
          'method' => 'POST',
          'route' => route,
          'nb_params' => nb_params,
          'client_infos' => hash_params
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
        when '/user'
          hash_params = {
            'uuid' => params[0].to_s,
            'password' => params[1].to_s
          }
        when '/users'
          hash_params = {
          }
        when '/item/:id'
          hash_params = {
            'token' => params[0].to_s,
            'item_id' => params[1].to_s
          }
      end

        Bankin::Error.request_params({
          'client_id' => client_id,
          'client_secret' => client_secret,
          'method' => 'DELETE',
          'route' => route,
          'nb_params' => nb_params,
          'client_infos' => hash_params
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
        when '/password'
          hash_params = {
            'current_password' => params[0].to_s,
            'new_password' => params[1].to_s,
            'uuid' => params[2].to_s
          }
        end

        Bankin::Error.request_params({
          'client_id' => client_id,
          'client_secret' => client_secret,
          'method' => 'DELETE',
          'route' => route,
          'nb_params' => nb_params,
          'client_infos' => hash_params
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
