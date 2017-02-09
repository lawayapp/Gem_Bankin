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
      data = Bankin::Client::Get.create_data_client('/users', Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      unless data.eql?(false)
        url = Bankin::Url::Get.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Get.new(uri, initheader = Bankin::Header.init())
        req.body = Bankin::Body::Get.init('/users', data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        Bankin::Response.send(res)
      end
    # END LIST_USERS(*params)
    end

    ##
    # METHODE GET LIST_BANKS
    # @params before, after,limit
    # Retourne le résultat de request
    def list_banks(before = nil, after = nil, limit = nil)

      params = [before, after, limit]
      data = Bankin::Client::Get.create_data_client('/banks', Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      unless data.eql?(false)
        url = Bankin::Url::Get.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Get.new(uri, initheader = Bankin::Header.init())
        req.body = Bankin::Body::Get.init('/banks', data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        Bankin::Response.send(res)
      end
    # END LIST_BANKS(*params)
    end

    ##
    # METHODE GET BANK
    # @params bank_id
    # Retourne le résultat de request
    def bank(bank_id)
      params = [bank_id.to_s]
      data = Bankin::Client::Get.create_data_client('/banks/:id', Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      unless data.eql?(false)
        url = Bankin::Url::Get.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Get.new(uri, initheader = Bankin::Header.init())
        req.body = Bankin::Body::Get.init('/banks/:id', data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default) do |http|
          http.request(req)
        end
        Bankin::Response.send(res)
      end
    # END BANKS(bank_id)
    end


    ##
    # METHODE GET LIST_ACCOUNT
    # @params token, before, after, limit
    # Retourne le résultat de la rquête contenant : le code, le body et le message. Se référer à la DOC
    def list_accounts(token, before = nil, after = nil, limit = nil)
      params = [token, before, after, limit]
      data = Bankin::Client::Get.create_data_client('/accounts', Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      unless data.eql?(false)
        url = Bankin::Url::Get.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Get.new(uri, initheader = Bankin::Header.init_baerer(token))
        req.body = Bankin::Body::Get.init('/accounts', data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default) do |http|
          http.request(req)
        end
        Bankin::Response.send(res)
      end
    # END LIST_ACCOUNT(*params)
    end

    ##
    # METHODE GET ACCOUNT
    # @params bank_id
    # Retourne le résultat de request
    def account(token, account_id)

      params = [token, account_id]
      data = Bankin::Client::Get.create_data_client('/accounts/:id', Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      unless data.eql?(false)
        url = Bankin::Url::Get.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Get.new(uri, initheader = Bankin::Header.init_baerer(token))
        req.body = Bankin::Body::Get.init('/accounts/:id', data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        Bankin::Response.send(res)
      end
    # END ACCOUNT(bank_id)
    end

    ##
    # METHODE GET LIST_ITEMS
    # @params token
    # Retourne le résultat de request
    def list_items(token, before = nil, after = nil, limit = nil)

      params = [token, before, after, limit]
      data = Bankin::Client::Get.create_data_client('/items', Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      unless data.eql?(false)
        url = Bankin::Url::Get.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Get.new(uri, initheader = Bankin::Header.init_baerer(token))
        req.body = Bankin::Body::Get.init('/items', data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        Bankin::Response.send(res)
      end
    # END ITEMS(token, before, after, limit)
    end

    ##
    # METHODE GET ITEM
    # @params token
    # Retourne le résultat de request
    def item(token, item_id)

      params = [token, item_id]
      data = Bankin::Client::Get.create_data_client('/items/:id', Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      unless data.eql?(false)
        url = Bankin::Url::Get.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Get.new(uri, initheader = Bankin::Header.init_baerer(token))
        req.body = Bankin::Body::Get.init('/items/:id', data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        Bankin::Response.send(res)
      end
    # END ITEM(token, item_id)
    end

    ##
    # METHODE GET ITEM_REFRESH
    # @params token item_id
    # Retourne le résultat de request
    def item_refresh(token, item_id)

      params = [token, item_id]
      data = Bankin::Client::Get.create_data_client('/items/:id/refresh', Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      unless data.eql?(false)
        url = Bankin::Url::Get.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Get.new(uri, initheader = Bankin::Header.init_baerer(token))
        req.body = Bankin::Body::Get.init('/items/:id/refresh', data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        Bankin::Response.send(res)
      end
    # END ITEM_REFRESH(token, item_id)
    end

    ##
    # METHODE GET TRANSACTiONS
    # @params token before after limit since until
    # Retourne le résultat de request
    def transactions(token, before = nil, after = nil, limit = nil, since = nil, untill = nil)

      params = [token, before, after, limit, since, untill]
      data = Bankin::Client::Get.create_data_client('/transactions', Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      unless data.eql?(false)
        url = Bankin::Url::Get.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Get.new(uri, initheader = Bankin::Header.init_baerer(token))
        req.body = Bankin::Body::Get.init('/transactions', data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        Bankin::Response.send(res)
      end
    # END TRANSACTIONS(params*)
    end

    ##
    # METHODE GET TRANSACTiONS UPDATES
    # @params token before after limit since
    # Retourne le résultat de request
    def transactions_updated(token, before = nil, after = nil, limit = nil, since = nil)

      params = [token, before, after, limit, since]
      data = Bankin::Client::Get.create_data_client('/transactions/updated', Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      unless data.eql?(false)
        url = Bankin::Url::Get.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Get.new(uri, initheader = Bankin::Header.init_baerer(token))
        req.body = Bankin::Body::Get.init('/transactions/updated', data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        Bankin::Response.send(res)
      end
    # END TRANSACTIONS_UPDATED(params*)
    end

    ##
    # METHODE GET TRANSACTiON
    # @params token transaction_id
    # Retourne le résultat de request
    def transaction(token, transaction_id)

      params = [token, transaction_id]
      data = Bankin::Client::Get.create_data_client('/transactions/:id', Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      unless data.eql?(false)
        url = Bankin::Url::Get.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Get.new(uri, initheader = Bankin::Header.init_baerer(token))
        req.body = Bankin::Body::Get.init('/transactions/:id', data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        Bankin::Response.send(res)
      end
    # END TRANSACTION(token, transaction_id)
    end

    ##
    # METHODE GET STOCKS
    # @params token before after limit
    # Retourne le résultat de request
    def stocks(token, before = nil, after = nil, limit = nil)

      params = [token, before, after, limit]
      data = Bankin::Client::Get.create_data_client('/stocks', Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      unless data.eql?(false)
        url = Bankin::Url::Get.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Get.new(uri, initheader = Bankin::Header.init_baerer(token))
        req.body = Bankin::Body::Get.init('/stocks', data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        Bankin::Response.send(res)
      end
    # END STOCKS(token, transaction_id)
    end

    ##
    # METHODE GET STOCKS_UPDATED
    # @params token before after limit since
    # Retourne le résultat de request
    def stocks_updated(token, before = nil, after = nil, limit = nil, since = nil)

      params = [token, before, after, limit, since]
      data = Bankin::Client::Get.create_data_client('/stocks/updated', Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      unless data.eql?(false)
        url = Bankin::Url::Get.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Get.new(uri, initheader = Bankin::Header.init_baerer(token))
        req.body = Bankin::Body::Get.init('/stocks/updated', data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        Bankin::Response.send(res)
      end
    # END STOCKS_UPDATED(token, transaction_id)
    end

    ##
    # METHODE GET STOCK
    # @params token stock_id
    # Retourne le résultat de request
    def stock(token, stock_id)

      params = [token, stock_id]
      data = Bankin::Client::Get.create_data_client('/stocks/:id', Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      unless data.eql?(false)
        url = Bankin::Url::Get.create_url(data)
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Get.new(uri, initheader = Bankin::Header.init_baerer(token))
        req.body = Bankin::Body::Get.init('/stocks/:id', data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        Bankin::Response.send(res)
      end
    # END STOCK(token, stock_id)
    end

    ##
    # METHODE GET CATEGORIES
    # @params before after limit
    # Retourne le résultat de request
    def categories(before = nil, after = nil, limit = nil)

      params = [before, after, limit]
      data = Bankin::Client::Get.create_data_client('/categories', Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      unless data.eql?(false)
        url = Bankin::Url::Get.create_url(data)
        puts url
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Get.new(uri, initheader = Bankin::Header.init())
        req.body = Bankin::Body::Get.init('/categories', data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        Bankin::Response.send(res)
      end
    # END CATEGORIES(before, after, limit)
    end

    ##
    # METHODE GET CATEGORIE
    # @params categorie_id
    # Retourne le résultat de request
    def categorie(categorie_id)

      params = [categorie_id]
      data = Bankin::Client::Get.create_data_client('/categories/:id', Bankin::Client::nb_params(params), params, @client_id, @client_secret)
      unless data.eql?(false)
        url = Bankin::Url::Get.create_url(data)
        puts url
        encoded_url = URI.encode(url)
        uri =  URI.parse(encoded_url)
        req = Net::HTTP::Get.new(uri, initheader = Bankin::Header.init())
        req.body = Bankin::Body::Get.init('/categories/:id', data)
        default = {use_ssl: true}
        res = Net::HTTP.start(uri.host, uri.port, default, ) do |http|
          http.request(req)
        end
        Bankin::Response.send(res)
      end
    # END CATEGORIE(categorie_id)
    end

  ##########################################################################
  # END CLASS BANKIN::GET
  end

###############################################################################
# END MODULE BANKIN::
end
