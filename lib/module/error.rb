module Bankin
    ###########################################################################
    # MODULE BANKIN::ERROR::
    # Module de gestion d'erreur
    module Error

      MAIL_EMPTY  = "[ERROR][PARAMS] - Mail is empty\n"
      PASSWORD_EMPTY = "[ERROR][PARAMS] - Password is empty\n"
      UUID_EMPTY = "[ERROR][PARAMS] - Uuid is empty\n"
      TOKEN_EMPTY = "[ERROR][PARAMS] - Token is empty\n"
      NEW_PWD_EMPTY = "[ERROR][PARAMS] - New_password is empty\n"
      CURRENT_PWD_EMPTY = "[ERROR][PARAMS] - Current_password is empty\n"

      BEFORE_EMPTY = "[WARNING][PARAMS] - Before is empty\n"
      AFTER_EMPTY = "[WARNING][PARAMS] - After is empty\n"
      LIMIT_EMPTY =  "[WARNING][PARAMS] - Limit is empty\n"

      def self.request_params(data)
        error = ''
        warning = ''
        if data["client_infos"].has_key?('email')
            case data['client_infos']['email']
            when ''
              error = error << MAIL_EMPTY
            end
          end

          if data['client_infos'].has_key?('password')
            case data['client_infos']['password']
            when ''
              error = error << PASSWORD_EMPTY
            end
          end

          if data['client_infos'].has_key?('before')
            case data['client_infos']['before']
            when ''
              warning = warning << BEFORE_EMPTY
            end
          end

          if data['client_infos'].has_key?('after')
            case data['client_infos']['after']
            when ''
              warning = warning << AFTER_EMPTY
            end
          end

          if data['client_infos'].has_key?('limit')
            case data['client_infos']['limit']
            when ''
              warning = warning << LIMIT_EMPTY
            end
          end

          if data['client_infos'].has_key?('uuid')
            case data['client_infos']['uuid']
            when ''
              error = error << UUID_EMPTY
            end
          end

          if data['client_infos'].has_key?('token')
            case data['client_infos']['token']
            when ''
              error = error << TOKEN_EMPTY
            end
          end

          if data['client_infos'].has_key?('new_password')
            case data['client_infos']['new_password']
            when ''
              error = error << NEW_PWD_EMPTY
            end
          end

          if data['client_infos'].has_key?('current_password')
            case data['client_infos']['current_password']
            when ''
              error = error << CURRENT_PWD_EMPTY
            end
          end
        if error.eql?('')
          unless warning.eql?('')
              puts warning
          end
          data
        else
          puts "\nBankin::Error"
          puts "[ERROR][METHOD] " << data["method"].to_s
          puts "[ERROR][ROUTE] " << data["route"].to_s
          puts error
          false
        end
      # END REQUEST_PARAMS(data)
      end

  ###########################################################################
  # END MODULE BANKIN::ERROR::
  end

############################################################################
# END MODULE BANKIN::
end
