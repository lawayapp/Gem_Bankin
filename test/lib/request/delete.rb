module Bankin
  class Delete
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
    # METHODE DELETE USERS
    # @params :uiid, password
    # Retourne le résultat de request
    def user(uiid, password)

      params = [uiid, password]
      data = Bankin::Client::Delete.create_data_client("/users", Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      if (data != false)
        url = Bankin::Url::Delete.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Delete.new(uri, initheader = Bankin::Header.init())
        req.body = Bankin::Body::Delete.init("/users", data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        return Bankin::Response.send(res)
      end
    # END USERS(uuid, password)
    end

    ##
    # METHODE DELETE ALL_USERS
    # Retourne le résultat de request
    # WARNING Cette requete n'est utilisable que dans le cadre de la sandbox API credential bankin.
    def all_users()

      params = []
      data = Bankin::Client::Delete.create_data_client("/users", Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      if (data != false)
        url = Bankin::Url::Delete.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Delete.new(uri, initheader = Bankin::Header.init())
        req.body = Bankin::Body::Delete.init("/users", data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        return Bankin::Response.send(res)
      end
    # END ALL_USERS()
    end

  ##########################################################################
  # END CLASS BANKIN::DELETE
  end

###############################################################################
# END MODULE BANKIN::
end
