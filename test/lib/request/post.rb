module Bankin
  class Post
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
    # METHODE POST CREATE_USER
    # @params email, password
    # Fonction de création d'utilisateur
    def create_user(email, password)
      params = [email, password]
      data = Bankin::Client::Post.create_data_client("/users", Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      if (data != false)
        url = Bankin::Url::Post.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Post.new(uri, initheader = Bankin::Header.init())
        req.body = Bankin::Body::Post.init("/users", data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        return Bankin::Response.send(res)
      end
    # END CREATE_USER(email, password)
    end

    ##
    # METHODE POST AUTHENTICATE USER
    # @params email, password
    # Fonction d'authentification
    def authenticate_user(email, password)
      params = [email, password]
      data = Bankin::Client::Post.create_data_client("/authenticate", Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      if (data != false)
        url = Bankin::Url::Post.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Post.new(uri, initheader = Bankin::Header.init())
        req.body = Bankin::Body::Post.init("/authenticate", data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        return Bankin::Response.send(res)
      end
    # END AUTHENTICATE_USER(email, password)
    end

    ##
    # METHODE LOGOUT USER
    # @params token
    # Fonction permettant de logout un utilisateur
    def logout_user(token)
      params = [token]
      data = Bankin::Client::Post.create_data_client("/logout", Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      if (data != false)
        url = Bankin::Url::Post.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Post.new(uri, initheader = Bankin::Header.init_baerer(token))
        req.body = Bankin::Body::Post.init("/logout", data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        return Bankin::Response.send(res)
      end
    # END LOGOUT_USERS(uuid)
    end

  ##########################################################################
  # END CLASS BANKIN::POST
  end

###############################################################################
# END MODULE BANKIN::
end
