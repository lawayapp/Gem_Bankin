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
          if data['limit'].eql?(nil)
            data['limit'] = '100'
          end
          (Url::URL_BANKIN).to_s + data['route'].to_s +
          '?limit=' + data['limit'].to_s +
          '&client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s +
          '&email=' + data['client_infos']['email'].to_s +
          '&password=' + data['client_infos']['password'].to_s
        when '/banks'
          if data['limit'].eql?(nil)
            data['limit'] = '50'
          end
          (Url::URL_BANKIN).to_s + data['route'].to_s +
          '?limit=' + data['limit'].to_s +
          '&client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s
        when '/banks/:id'
          (Url::URL_BANKIN).to_s +
          '/banks/' + data['client_infos']['bank_id'] +
          '?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s
        when '/accounts'
          if data['limit'].eql?(nil)
            data['limit'] = '50'
          end
          (Url::URL_BANKIN).to_s + data['route'].to_s +
          '?limit=' + data['client_infos']['limit'].to_s +
          '&client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s
        when '/accounts/:id'
          (Url::URL_BANKIN).to_s +
          '/accounts/' + data['client_infos']['account_id'] +
          '?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s
        when '/items'
          (Url::URL_BANKIN).to_s + data['route'].to_s +
          '?limit=' + data['limit'].to_s +
          '&client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s
        when '/items/:id'
          (Url::URL_BANKIN).to_s +
          '/items/' + data['client_infos']['item_id'] +
          '?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s
        when '/items/:id/refresh'
          (Url::URL_BANKIN).to_s +
          '/items/' + data['client_infos']['item_id'] +
          '/refresh/status?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s
        when '/transactions'
          puts data['client_infos']
          (Url::URL_BANKIN).to_s +
          '/transactions' +
          '?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s
        when '/transactions/updated'
          (Url::URL_BANKIN).to_s +
          '/transactions/updated' +
          '?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s
        when '/transactions/:id'
          (Url::URL_BANKIN).to_s +
          '/transactions/' + data['client_infos']['transaction_id'] +
          '?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s
        when '/stocks'
          (Url::URL_BANKIN).to_s +
          '/stocks?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s
        when '/stocks/updated'
          (Url::URL_BANKIN).to_s +
          '/stocks/updated?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s
        when '/stocks/:id'
          (Url::URL_BANKIN).to_s +
          '/stocks/' + data['client_infos']['stock_id'] +
          '?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s
        when '/categories'
          (Url::URL_BANKIN).to_s +
          '/categories' +
          '?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s
        when '/categories/:id'
          (Url::URL_BANKIN).to_s +
          '/categories/' + data['client_infos']['categorie_id'] + 
          '?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s
        end

      # END CREATE_URL(data)
      end

    ###########################################################################
    # END MODULE BANKIN::URL::GET::
    end

    ############################################################################
    # MODULE BANKIN::URL::POST::
    # Module de construction de la chaine d'url pour les méthodes POST
    module Post

      def self.create_url(data)
        case data['route']
        when '/users'
          (Url::URL_BANKIN).to_s + data['route'].to_s +
          '?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s +
          '&email=' + data['client_infos']['email'].to_s +
          '&password=' + data['client_infos']['password'].to_s
        when '/authenticate'
          (Url::URL_BANKIN).to_s + data['route'].to_s +
          '?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s +
          '&email=' + data['client_infos']['email'].to_s +
          '&password=' + data['client_infos']['password'].to_s
        when '/logout'
          (Url::URL_BANKIN).to_s + data['route'].to_s +
          '?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s
        when '/items/:id/refresh'
          (Url::URL_BANKIN).to_s + '/items/' +
          data['client_infos']['item_id'] +
          '/refresh?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s
        when '/items/:id/mfa'
          (Url::URL_BANKIN).to_s + '/items/' +
          data['client_infos']['item_id'] +
          '/mfa?otp=' + data['client_infos']['otp'] +
          '&client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s
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
        when '/user'
          (Url::URL_BANKIN).to_s + data['route'].to_s + '/' + data['client_infos']['uuid'] +
          '?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s +
          '&password=' + data['client_infos']['password'].to_s
        when '/users'
          (Url::URL_BANKIN).to_s + data['route'].to_s +
          '?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s
        when '/item/:id'
          (Url::URL_BANKIN).to_s +
          '/items/' + data['client_infos']['item_id'] +
          '?client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s
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
          (Url::URL_BANKIN).to_s + '/users/' + data['client_infos']['uuid'] +
          '/password?' + 'client_id=' + data['client_id'].to_s +
          '&client_secret=' + data['client_secret'].to_s +
          '&current_password=' + data['client_infos']['current_password'].to_s +
          '&new_password=' + data['client_infos']['current_password'].to_s
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
