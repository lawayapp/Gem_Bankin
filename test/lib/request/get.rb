module Bankin
  class Get
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
    # METHODE GET LIST_USERS
    # @params email, password
    # Retourne le résultat de request
    def list_users(before = nil, after = nil, limit = nil)

      params = [before, after, limit]
      data = Bankin::Client::Get.create_data_client("/users", Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      if (data != false)
        url = Bankin::Url::Get.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Get.new(uri, initheader = Bankin::Header.init())
        req.body = Bankin::Body::Get.init("/users", data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        return Bankin::Response.send(res)
      end
    # END LIST_USERS(*params)
    end

    ##
    # METHODE GET LIST_BANKS
    # @params before, after,limit
    # Retourne le résultat de request
    def list_banks(before = nil, after = nil, limit = nil)

      params = [before, after, limit]
      data = Bankin::Client::Get.create_data_client("/banks", Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      if (data != false)
        url = Bankin::Url::Get.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Get.new(uri, initheader = Bankin::Header.init())
        req.body = Bankin::Body::Get.init("/banks", data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        return Bankin::Response.send(res)
      end
    # END LIST_BANKS(*params)
    end

    ##
    # METHODE GET LIST_ACCOUNT
    # @params token, before, after, limit
    # Retourne le résultat de request
    def list_accounts(token, before = nil, after = nil, limit = nil)

      params = [token, before, after, limit]
      data = Bankin::Client::Get.create_data_client("/accounts", Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      if (data != false)
        url = Bankin::Url::Get.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Get.new(uri, initheader = Bankin::Header.init_baerer(token))
        req.body = Bankin::Body::Get.init("/accounts", data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        return Bankin::Response.send(res)
      end
    # END LIST_ACCOUNT(*params)
    end

    ##
    # METHODE GET ACCOUNT
    # @params token, account_id
    # Retourne le résultat de request
    def account(token, account_id)

      params = [token, account_id]
      data = Bankin::Client::Get.create_data_client("/accounts/:id", Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      if (data != false)
        url = Bankin::Url::Get.create_url(data)
        puts url
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Get.new(uri, initheader = Bankin::Header.init_baerer(token))
        req.body = Bankin::Body::Get.init("/accounts", data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        return Bankin::Response.send(res)
      end
    # END ACCOUNT(*params)
    end

  ##########################################################################
  # END CLASS BANKIN::GET
  end

###############################################################################
# END MODULE BANKIN::
end
