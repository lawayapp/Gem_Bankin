module Bankin
  #############################################################################
  # MODULE BANKIN::URL::
  # Module de création d'url pour requête
  module Url

    URL_BANKIN = "https://sync.bankin.com/v2"

    ###########################################################################
    # MODULE BANKIN::URL::GET::
    # Module de création d'url pour les méthodes GET
    module Get

      def self.create_url(data)
        case data['route']
        when '/users'
          if data['limit'] == nil
            data['limit'] = "100"
          end
          return((Url::URL_BANKIN).to_s + data['route'].to_s +
          '?limit=' + data['limit'].to_s +
          '&client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s +
          '&email=' + data['client_infos']['email'].to_s +
          '&password=' + data['client_infos']['password'].to_s)
        when '/banks'
          if data['limit'] == nil
            data['limit'] = "50"
          end
        return((Url::URL_BANKIN).to_s + data['route'].to_s +
          '?limit=' + data['limit'].to_s +
          '&client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s)
        when '/accounts'
          if data['limit'] == nil
            data['limit'] = "50"
          end
        return((Url::URL_BANKIN).to_s + data['route'].to_s +
          '?limit=' + data['client_infos']['limit'].to_s +
          '&client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s)
        when '/accounts/:id'
          return((Url::URL_BANKIN).to_s +
          '/accounts/' + data['client_infos']['account_id'] +
          '?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s)
        end

      # END CREATE_URL(data)
      end

    ###########################################################################
    # END MODULE BANKIN::URL::GET::
    end

    ############################################################################
    # MODULE BANKIN::URL::POST::
    # Module de création d'url pour les méthodes POST
    module Post

      def self.create_url(data)
        case data['route']
        when '/users'
          return((Url::URL_BANKIN).to_s + data['route'].to_s +
          '?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s +
          '&email=' + data['client_infos']['email'].to_s +
          '&password=' + data['client_infos']['password'].to_s)
        when '/authenticate'
          return((Url::URL_BANKIN).to_s + data['route'].to_s +
          '?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s +
          '&email=' + data['client_infos']['email'].to_s +
          '&password=' + data['client_infos']['password'].to_s)
        when '/logout'
          return((Url::URL_BANKIN).to_s + data['route'].to_s +
          '?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s)
        end

      # END CREATE_URL(data)
      end

    ###########################################################################
    # END MODULE BANKIN::POST::
    end


    ############################################################################
    # MODULE BANKIN::URL::DELETE::
    # Module de création d'url pour les méthodes DELETE
    module Delete

      def self.create_url(data)
        case data['route']
        when '/users'
          if (data['nb_params'].to_i > 0)
            return((Url::URL_BANKIN).to_s + data['route'].to_s + '/' + data['client_infos']['uuid'] +
            '?client_id=' + data['client_id'].to_s +
            '&client_secret=' + data['client_secret'].to_s +
            '&password=' + data['client_infos']['password'].to_s)
          else
            return((Url::URL_BANKIN).to_s + data['route'].to_s +
            '?client_id=' + data['client_id'].to_s +
            '&client_secret=' + data['client_secret'].to_s)
          end
        end

      # END CREATE_URL(data)
      end

    ##########################################################################
    # END MODULE BANKIN::DELETE::
    end

    ############################################################################
    # MODULE BANKIN::URL::PUT::
    # Module de création d'url pour les méthodes PUT
    module Put

      def self.create_url(data)
        case data['route']
        when '/password'
          return((Url::URL_BANKIN).to_s + '/users/' + data['client_infos']['uuid'] +
          '/password?' + 'client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s +
          '&current_password=' + data['client_infos']['current_password'].to_s +
          '&new_password=' + data['client_infos']['current_password'].to_s)
        end

      # END CREATE_URL(data)
      end

    ##########################################################################
    # END MODULE BANKIN::POST::
    end

  ##############################################################################
  # END MODULE BANKIN::URL::
  end

################################################################################
# END MODULE BANKIN::
end
