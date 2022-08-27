module Mailchimp
    class Error < StandardError
    end
    class ValidationError < Error
    end
    class ServerMethodUnknownError < Error
    end
    class ServerInvalidParametersError < Error
    end
    class UnknownExceptionError < Error
    end
    class RequestTimedOutError < Error
    end
    class ZendUriExceptionError < Error
    end
    class PDOExceptionError < Error
    end
    class AvestaDbExceptionError < Error
    end
    class XMLRPC2ExceptionError < Error
    end
    class XMLRPC2FaultExceptionError < Error
    end
    class TooManyConnectionsError < Error
    end
    class ParseExceptionError < Error
    end
    class UserUnknownError < Error
    end
    class UserDisabledError < Error
    end
    class UserDoesNotExistError < Error
    end
    class UserNotApprovedError < Error
    end
    class InvalidApiKeyError < Error
    end
    class UserUnderMaintenanceError < Error
    end
    class InvalidAppKeyError < Error
    end
    class InvalidIPError < Error
    end
    class UserDoesExistError < Error
    end
    class UserInvalidRoleError < Error
    end
    class UserInvalidActionError < Error
    end
    class UserMissingEmailError < Error
    end
    class UserCannotSendCampaignError < Error
    end
    class UserMissingModuleOutboxError < Error
    end
    class UserModuleAlreadyPurchasedError < Error
    end
    class UserModuleNotPurchasedError < Error
    end
    class UserNotEnoughCreditError < Error
    end
    class MCInvalidPaymentError < Error
    end
    class ListDoesNotExistError < Error
    end
    class ListInvalidInterestFieldTypeError < Error
    end
    class ListInvalidOptionError < Error
    end
    class ListInvalidUnsubMemberError < Error
    end
    class ListInvalidBounceMemberError < Error
    end
    class ListAlreadySubscribedError < Error
    end
    class ListNotSubscribedError < Error
    end
    class ListInvalidImportError < Error
    end
    class MCPastedListDuplicateError < Error
    end
    class MCPastedListInvalidImportError < Error
    end
    class EmailAlreadySubscribedError < Error
    end
    class EmailAlreadyUnsubscribedError < Error
    end
    class EmailNotExistsError < Error
    end
    class EmailNotSubscribedError < Error
    end
    class ListMergeFieldRequiredError < Error
    end
    class ListCannotRemoveEmailMergeError < Error
    end
    class ListMergeInvalidMergeIDError < Error
    end
    class ListTooManyMergeFieldsError < Error
    end
    class ListInvalidMergeFieldError < Error
    end
    class ListInvalidInterestGroupError < Error
    end
    class ListTooManyInterestGroupsError < Error
    end
    class CampaignDoesNotExistError < Error
    end
    class CampaignStatsNotAvailableError < Error
    end
    class CampaignInvalidAbsplitError < Error
    end
    class CampaignInvalidContentError < Error
    end
    class CampaignInvalidOptionError < Error
    end
    class CampaignInvalidStatusError < Error
    end
    class CampaignNotSavedError < Error
    end
    class CampaignInvalidSegmentError < Error
    end
    class CampaignInvalidRssError < Error
    end
    class CampaignInvalidAutoError < Error
    end
    class MCContentImportInvalidArchiveError < Error
    end
    class CampaignBounceMissingError < Error
    end
    class CampaignInvalidTemplateError < Error
    end
    class InvalidEcommOrderError < Error
    end
    class AbsplitUnknownError < Error
    end
    class AbsplitUnknownSplitTestError < Error
    end
    class AbsplitUnknownTestTypeError < Error
    end
    class AbsplitUnknownWaitUnitError < Error
    end
    class AbsplitUnknownWinnerTypeError < Error
    end
    class AbsplitWinnerNotSelectedError < Error
    end
    class InvalidAnalyticsError < Error
    end
    class InvalidDateTimeError < Error
    end
    class InvalidEmailError < Error
    end
    class InvalidSendTypeError < Error
    end
    class InvalidTemplateError < Error
    end
    class InvalidTrackingOptionsError < Error
    end
    class InvalidOptionsError < Error
    end
    class InvalidFolderError < Error
    end
    class InvalidURLError < Error
    end
    class ModuleUnknownError < Error
    end
    class MonthlyPlanUnknownError < Error
    end
    class OrderTypeUnknownError < Error
    end
    class InvalidPagingLimitError < Error
    end
    class InvalidPagingStartError < Error
    end
    class MaxSizeReachedError < Error
    end
    class MCSearchExceptionError < Error
    end
    class GoalSaveFailedError < Error
    end
    class ConversationDoesNotExistError < Error
    end
    class ConversationReplySaveFailedError < Error
    end
    class FileNotFoundExceptionError < Error
    end
    class FolderNotFoundExceptionError < Error
    end
    class FolderExistsExceptionError < Error
    end
end

