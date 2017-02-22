require "api_bankin/version"

require "request/post"
require "request/put"
require "request/delete"
require "request/get"

require "module/client"
require "module/error"
require "module/header"
require "module/url"
require "module/body"
require "module/response"

require "json"
require "net/http"

module Bankin
  #Permet de construire la gem depuis initializer
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Request.new
    yield(configuration)
  end

  ##
  # Principale class de la gem
  # Cette class est la première à être instanciée, elle prend en paramètre le client_id et le client_secret
  # Ces deux variables sont stockées et utilisées lors de l'initialisation des 4 grandes class
  # GET - POST - PUT - DELETE
  # Ces class, permettent d'effectuer les requêtes avec l'api Bankin.
  class Request

    attr_reader :post
    attr_reader :get
    attr_reader :put
    attr_reader :delete

    attr_reader :client_id
    attr_reader :client_secret

    def initialize
      #Construction without params in config only initializer
      @client_id = 'yourClientIdInConfigure'
      @client_secret = 'yourClientSecretInConfigure'

      @post = Bankin::Post.new(@client_id, @client_secret)
      @get = Bankin::Get.new(@client_id, @client_secret)
      @put = Bankin::Put.new(@client_id, @client_secret)
      @delete = Bankin::Delete.new(@client_id, @client_secret)
    end

    def initialize(client_id, client_secret)
      #Construction with params
      @client_id = client_id
      @client_secret = client_secret

      @post = Bankin::Post.new(@client_id, @client_secret)
      @get = Bankin::Get.new(@client_id, @client_secret)
      @put = Bankin::Put.new(@client_id, @client_secret)
      @delete = Bankin::Delete.new(@client_id, @client_secret)
    end

    def set_client_id(client_id)
      @client_id = client_id

      @post.set_client_id(@client_id)
      @get.set_client_id(@client_id)
      @put.set_client_id(@client_id)
      @delete.set_client_id(@client_id)
    end

    def set_client_secret(client_secret)
      @client_secret = client_secret

      @post.set_client_secret(@client_secret)
      @get.set_client_secret(@client_secret)
      @put.set_client_secret(@client_secret)
      @delete.set_client_secret(@client_secret)
    end

    def set_client_id_and_secret(client_id, client_secret)
      @client_id = client_id
      @client_secret = client_secret

      @post.set_client_id_and_secret(@client_id, @client_secret)
      @get.set_client_id_and_secret(@client_id, @client_secret)
      @put.set_client_id_and_secret(@client_id, @client_secret)
      @delete.set_client_id_and_secret(@client_id, @client_secret)
    end

  end
end
