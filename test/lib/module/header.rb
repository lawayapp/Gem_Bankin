module Bankin
  ###########################################################################
  # MODULE BANKIN::HEADER::
  # Module de maintenance du Header
  # Le header d'une request doit contenir le content-type et la version de bankin
  module Header

    CONTENT_TYPE = "application/json"
    BANKIN_VERSION = "2016-01-18"
    BEARER = "Bearer "
    def self.init()
      return(header = {
        'Content_type' => CONTENT_TYPE,
        'Bankin-Version' => BANKIN_VERSION
    })
    #END INIT_HEADER()
    end

    def self.init_baerer(token)

      return(header = {
        'Content_type' => CONTENT_TYPE,
        'Authorization' => BEARER + token.to_s,
        'Bankin-Version' => BANKIN_VERSION
    })
    #END INIT_HEADER()
    end

  #############################################################################
  #END MODULE BANKIN::HEADER::
  end

###############################################################################
# END MODULE BANKIN::
end
