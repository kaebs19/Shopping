//
//  Alerts.swift
//  Shopping
//
//  Created by Mohammed Saleh on 02/01/2025.
//

import Foundation

enum Alerts: String , CaseIterable {
    case Error = "ErrorAlert"
    case PleaseFillAllFields = "PleaseFillAllFieldsAlert"
    case PasswordDoesNotMatch = "PasswordDoesNotMatchAlert"
    case YouMastAgreeToTermsAndConditions = "YouMastAgreeToTermsAndConditionsAlert"
    case EmailOrPasswordIsEmptyAlert = "EmailOrPasswordIsEmptyAlert"
    case Success = "SuccessAlert"
    case Successfully = "SuccessfullyLoggedInAlert"
    case PasswordIsShort = "PasswordIsShortAlert"
    case EmailFormatIsIncorrect = "EmailFormatIsIncorrectAlert"
    case PasswordIsEmpty = "PasswordIsEmptyAlert"
    case EmailIsEmpty = "EmailIsEmptyAlert"
    case warning = "WarningAlert"
    case warningMessage = "WarningMessageAlert"
    case yes = "YesAlert"
    case no = "NoAlert"
    case cancel = "CancelAlert"
    case AddedFavoritesList = "AddedToYourFavoritesListAlert"
    case RemovedFavoritesList = "RemovedFromYourFavoritesListAlert"
    case FavoritesUpdateTitle = "FavoritesUpdateTitleAlert"
    case ChooseImage = "ChooseImageAlert"
    case DetailsChooseImage = "DetailsChooseImageAlert"
    case Camera      = "CameraAlert"
    case PhotoLabary    = "PhotoLabaryAlert"

    
    var texts: String {
        return rawValue.localized
    }
}
