module Bankin
  class Put
    attr_reader :client_id
    attr_reader :client_secret

    def initialize(client_id, client_secret)
      @client_id = client_id
      @client_secret = client_secret
    end

    def set_client_id(client_id)
      @client_id = client_id
    end

    def set_client_secret(client_secret)
      @client_secret = client_secret
    end

    def set_client_id_and_secret(client_id, client_secret)
      @client_id = client_id
      @client_secret = client_secret
    end

    ##
    # FONCTION EDIT USERS CREDENTIAL
    # @params current_pwd, new_pwd, uuid
    # Fonction permettant de mettre à jour le password de l'utilisateur
    # WARNING : changer le pwd ferme les sessions active de l'utilisateur
    #           L'utilisateur devra se connecter de nouveau
    def edit_users_credential(current_pwd, new_pwd, uuid)
      params = [current_pwd, new_pwd, uuid]
      data = Bankin::Client::Put.create_data_client("/password", Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      if (data != false)
        url = Bankin::Url::Put.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Put.new(uri, initheader = Bankin::Header.init())
        req.body = Bankin::Body::Put.init("/authenticate", data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        return Bankin::Response.send(res)
      end
    # END EDIT USER CRENDENTIAL(current_pwd, new_pwd, uuid)
    end

  ##########################################################################
  # END CLASS BANKIN::PUT
  end

###############################################################################
# END MODULE BANKIN::
end
