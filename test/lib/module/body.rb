module Bankin
  ##############################################################################
  # MODULE BANKIN::BODY::
  # Module de création du body de la requete
  module Body

    ############################################################################
    # MODULE BANKIN::GET::
    # Permet de construire le body de la requete pour les méthodes GET
    module Get

      def self.init(route, data)
        case route
        when "/users"
          return(data = {
            'client_id'=> data["client_id"],
            'client_secret'=> data['client_secret'],
            'limit' => data['client_infos']['limit'],
            'after' => data['client_infos']['after'],
            'before' => data['client_infos']['before']
          }.to_json)
        when "/banks"
          return(data ={
            'client_id'=> data["client_id"],
            'client_secret'=> data['client_secret'],
            'limit' => data['client_infos']['limit'],
            'after' => data['client_infos']['after'],
            'before' => data['client_infos']['before']
          }.to_json)
        when "/accounts"
          return(data = {
            'client_id'=> data["client_id"],
            'client_secret'=> data['client_secret'],
            'limit' => data['client_infos']['limit'],
            'after' => data['client_infos']['after'],
            'before' => data['client_infos']['before']
          }.to_json)
        when "/accounts/:id"
          return(data = {
            'client_id'=> data["client_id"],
            'client_secret'=> data['client_secret']
          })
        end
      # END INIT(route, data)
      end

    ############################################################################
    # END MODULE BANKIN::GET::
    end

    ############################################################################
    # MODULE BANKIN::POST::
    # Permet de construire le body de la requete pour les méthodes POST
    module Post

      def self.init(route, data)
        nb_params = data["nb_params"].to_i
        case route
        when "/users"
          return(data = {
            'client_id'=> data["client_id"],
            'client_secret'=> data['client_secret'],
            'email' => data['client_infos']['email'],
            'password'=> data['client_infos']['password']
          }.to_json)
        when "/authenticate"
          return(data = {
            'client_id'=> data["client_id"],
            'client_secret'=> data['client_secret'],
            'email' => data['client_infos']['email'],
            'password'=> data['client_infos']['password']
          }.to_json)
        when "/logout"
          return(data = {
            'client_id'=> data["client_id"],
            'client_secret'=> data['client_secret']
          }.to_json)
        end
      end

    ############################################################################
    # END MODULE BANKIN::POST::
    end

    ############################################################################
    # MODULE BANKIN::DELETE::
    # Permet de construire le body de la requete pour les méthodes DELETE
    module Delete

      def self.init(route, data)
        if route == "/users"
          if (data['nb_params'].to_i > 0)
            return(data = {
              'client_id'=> data["client_id"],
              'client_secret'=> data['client_secret'],
              'uuid' => data['client_infos']['uuid'],
              'password' => data['client_infos']['password'],
            }.to_json)
          else
            return(data = {
              'client_id'=> data["client_id"],
              'client_secret'=> data['client_secret'],
            }.to_json)
          end
        end
      end

    ############################################################################
    # END MODULE BANKIN::DELETE::
    end

    ############################################################################
    # MODULE BANKIN::PUT::
    # Permet de construire le body de la requete pour les méthodes Put
    module Put

      def self.init(route, data)
        if route == "/password"
          return(data = {
            'client_id'=> data["client_id"],
            'client_secret'=> data['client_secret'],
            'uuid' => data['client_infos']['uuid'],
            'current_password' => data['client_infos']['current_password'],
            'new_password' => data['client_infos']['new_password']
          }.to_json)
        end
      end

    ############################################################################
    # END MODULE BANKIN::DELETE::
    end

  ##############################################################################
  # END MODULE BANKIN::BODY::
  end

################################################################################
# END MODULE BANKIN::
end
