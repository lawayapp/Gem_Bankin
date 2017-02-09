module Bankin
  #############################################################################
  # MODULE BANKIN::RESULT::
  # Module de construction de la réponse format hash
  module Response

    def self.send(data)
      return({
        'code' => data.code,
        'body' => data.body,
        'message' => data.message
        })
    # END SEND(data)
    end

  ##############################################################################
  # END MODULE BANKIN::RESULT
  end

###############################################################################
# END MODULE BANKIN::
end
