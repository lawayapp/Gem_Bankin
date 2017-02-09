module Bankin
  ###########################################################################
  # MODULE BANKIN::HEADER::
  # Module de maintenance du Header
  # Le header d'une request doit contenir le content-type et la version de bankin
  module Header

    CONTENT_TYPE = 'application/json'
    BANKIN_VERSION = '2016-01-18'
    def self.init()
      return(header = {
        'Content_type' => CONTENT_TYPE,
        'Bankin-Version' => BANKIN_VERSION
    })
    #END INIT_HEADER()
    end

    def self.init_baerer(token)
      baerer = 'Bearer '
      return(header = {
        'Content_type' => CONTENT_TYPE,
        'Authorization' => baerer << token.to_s,
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
