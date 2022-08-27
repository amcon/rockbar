require 'rubygems'
require 'excon'
require 'json'

require 'mailchimp/errors'
require 'mailchimp/api'

module Mailchimp
    class API

        attr_accessor :host, :path, :apikey, :debug, :session

        def initialize(apikey=nil, debug=false)
            @host = 'https://api.mailchimp.com'
            @path = '/2.0/'
            @dc = 'us1'

            unless apikey
                apikey = ENV['MAILCHIMP_APIKEY'] || read_configs
            end

            raise Error, 'You must provide a MailChimp API key' unless apikey

            @apikey = apikey
            if @apikey.split('-').length == 2
                @host = "https://#{@apikey.split('-')[1]}.api.mailchimp.com"
            else
                raise InvalidApiKeyError, 'Your MailChimp API key must contain a suffix subdomain (e.g. "-us8").'
            end

            @session = Excon.new @host
            @debug = debug
        end

        def call(url, params={})
            params[:apikey] = @apikey
            params = JSON.generate(params)
            r = @session.post(:path => "#{@path}#{url}.json", :headers => {'Content-Type' => 'application/json'}, :body => params)
            
            cast_error(r.body) if r.status != 200
            return JSON.parse(r.body)
        end

        def read_configs()
            [File.expand_path('~/.mailchimp.key'), '/etc/mailchimp.key'].delete_if{ |p| not File.exist? p}.each do |path|
                f = File.new path
                apikey = f.read.strip
                f.close
                return apikey if apikey != ''
            end

            return nil
        end

        def cast_error(body)

            error_map = {
                'ValidationError' => ValidationError,
                'ServerError_MethodUnknown' => ServerMethodUnknownError,
                'ServerError_InvalidParameters' => ServerInvalidParametersError,
                'Unknown_Exception' => UnknownExceptionError,
                'Request_TimedOut' => RequestTimedOutError,
                'Zend_Uri_Exception' => ZendUriExceptionError,
                'PDOException' => PDOExceptionError,
                'Avesta_Db_Exception' => AvestaDbExceptionError,
                'XML_RPC2_Exception' => XMLRPC2ExceptionError,
                'XML_RPC2_FaultException' => XMLRPC2FaultExceptionError,
                'Too_Many_Connections' => TooManyConnectionsError,
                'Parse_Exception' => ParseExceptionError,
                'User_Unknown' => UserUnknownError,
                'User_Disabled' => UserDisabledError,
                'User_DoesNotExist' => UserDoesNotExistError,
                'User_NotApproved' => UserNotApprovedError,
                'Invalid_ApiKey' => InvalidApiKeyError,
                'User_UnderMaintenance' => UserUnderMaintenanceError,
                'Invalid_AppKey' => InvalidAppKeyError,
                'Invalid_IP' => InvalidIPError,
                'User_DoesExist' => UserDoesExistError,
                'User_InvalidRole' => UserInvalidRoleError,
                'User_InvalidAction' => UserInvalidActionError,
                'User_MissingEmail' => UserMissingEmailError,
                'User_CannotSendCampaign' => UserCannotSendCampaignError,
                'User_MissingModuleOutbox' => UserMissingModuleOutboxError,
                'User_ModuleAlreadyPurchased' => UserModuleAlreadyPurchasedError,
                'User_ModuleNotPurchased' => UserModuleNotPurchasedError,
                'User_NotEnoughCredit' => UserNotEnoughCreditError,
                'MC_InvalidPayment' => MCInvalidPaymentError,
                'List_DoesNotExist' => ListDoesNotExistError,
                'List_InvalidInterestFieldType' => ListInvalidInterestFieldTypeError,
                'List_InvalidOption' => ListInvalidOptionError,
                'List_InvalidUnsubMember' => ListInvalidUnsubMemberError,
                'List_InvalidBounceMember' => ListInvalidBounceMemberError,
                'List_AlreadySubscribed' => ListAlreadySubscribedError,
                'List_NotSubscribed' => ListNotSubscribedError,
                'List_InvalidImport' => ListInvalidImportError,
                'MC_PastedList_Duplicate' => MCPastedListDuplicateError,
                'MC_PastedList_InvalidImport' => MCPastedListInvalidImportError,
                'Email_AlreadySubscribed' => EmailAlreadySubscribedError,
                'Email_AlreadyUnsubscribed' => EmailAlreadyUnsubscribedError,
                'Email_NotExists' => EmailNotExistsError,
                'Email_NotSubscribed' => EmailNotSubscribedError,
                'List_MergeFieldRequired' => ListMergeFieldRequiredError,
                'List_CannotRemoveEmailMerge' => ListCannotRemoveEmailMergeError,
                'List_Merge_InvalidMergeID' => ListMergeInvalidMergeIDError,
                'List_TooManyMergeFields' => ListTooManyMergeFieldsError,
                'List_InvalidMergeField' => ListInvalidMergeFieldError,
                'List_InvalidInterestGroup' => ListInvalidInterestGroupError,
                'List_TooManyInterestGroups' => ListTooManyInterestGroupsError,
                'Campaign_DoesNotExist' => CampaignDoesNotExistError,
                'Campaign_StatsNotAvailable' => CampaignStatsNotAvailableError,
                'Campaign_InvalidAbsplit' => CampaignInvalidAbsplitError,
                'Campaign_InvalidContent' => CampaignInvalidContentError,
                'Campaign_InvalidOption' => CampaignInvalidOptionError,
                'Campaign_InvalidStatus' => CampaignInvalidStatusError,
                'Campaign_NotSaved' => CampaignNotSavedError,
                'Campaign_InvalidSegment' => CampaignInvalidSegmentError,
                'Campaign_InvalidRss' => CampaignInvalidRssError,
                'Campaign_InvalidAuto' => CampaignInvalidAutoError,
                'MC_ContentImport_InvalidArchive' => MCContentImportInvalidArchiveError,
                'Campaign_BounceMissing' => CampaignBounceMissingError,
                'Campaign_InvalidTemplate' => CampaignInvalidTemplateError,
                'Invalid_EcommOrder' => InvalidEcommOrderError,
                'Absplit_UnknownError' => AbsplitUnknownError,
                'Absplit_UnknownSplitTest' => AbsplitUnknownSplitTestError,
                'Absplit_UnknownTestType' => AbsplitUnknownTestTypeError,
                'Absplit_UnknownWaitUnit' => AbsplitUnknownWaitUnitError,
                'Absplit_UnknownWinnerType' => AbsplitUnknownWinnerTypeError,
                'Absplit_WinnerNotSelected' => AbsplitWinnerNotSelectedError,
                'Invalid_Analytics' => InvalidAnalyticsError,
                'Invalid_DateTime' => InvalidDateTimeError,
                'Invalid_Email' => InvalidEmailError,
                'Invalid_SendType' => InvalidSendTypeError,
                'Invalid_Template' => InvalidTemplateError,
                'Invalid_TrackingOptions' => InvalidTrackingOptionsError,
                'Invalid_Options' => InvalidOptionsError,
                'Invalid_Folder' => InvalidFolderError,
                'Invalid_URL' => InvalidURLError,
                'Module_Unknown' => ModuleUnknownError,
                'MonthlyPlan_Unknown' => MonthlyPlanUnknownError,
                'Order_TypeUnknown' => OrderTypeUnknownError,
                'Invalid_PagingLimit' => InvalidPagingLimitError,
                'Invalid_PagingStart' => InvalidPagingStartError,
                'Max_Size_Reached' => MaxSizeReachedError,
                'MC_SearchException' => MCSearchExceptionError,
                'Goal_SaveFailed' => GoalSaveFailedError,
                'Conversation_DoesNotExist' => ConversationDoesNotExistError,
                'Conversation_ReplySaveFailed' => ConversationReplySaveFailedError,
                'File_Not_Found_Exception' => FileNotFoundExceptionError,
                'Folder_Not_Found_Exception' => FolderNotFoundExceptionError,
                'Folder_Exists_Exception' => FolderExistsExceptionError
            }

            begin
                error_info = JSON.parse(body)
                if error_info['status'] != 'error' or not error_info['name']
                    raise Error, "We received an unexpected error: #{body}"
                end
                if error_map[error_info['name']]
                    raise error_map[error_info['name']], error_info['error']
                else
                    raise Error, error_info['error']
                end
            rescue JSON::ParserError
                raise Error, "We received an unexpected error: #{body}"
            end
        end

        def folders()
            Folders.new self
        end
        def templates()
            Templates.new self
        end
        def users()
            Users.new self
        end
        def helper()
            Helper.new self
        end
        def mobile()
            Mobile.new self
        end
        def conversations()
            Conversations.new self
        end
        def ecomm()
            Ecomm.new self
        end
        def neapolitan()
            Neapolitan.new self
        end
        def lists()
            Lists.new self
        end
        def campaigns()
            Campaigns.new self
        end
        def vip()
            Vip.new self
        end
        def reports()
            Reports.new self
        end
        def gallery()
            Gallery.new self
        end
        def goal()
            Goal.new self
        end
    end
end

