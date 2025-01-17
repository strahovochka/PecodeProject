//
//  Identifiers.swift
//  FitnessApp
//
//  Created by Jane Strashok on 10.07.2024.
//

import Foundation

enum Identifiers {
    enum Storyboard {
        static let registration = "Registration"
        static let splashScreen = "Splash"
        static let tabBar = "TabBar"
        static let home = "Home"
        static let progress = "Progress"
        static let calculator = "Calculator"
        static let muscles = "Muscles"
        static let logIn = "LogIn"
        static let forgotPassword = "ForgotPassword"
        static let popUp = "PopUp"
        static let profile = "Profile"
        static let optionsPopUp = "OptionsPopUp"
        static let chart = "Chart"
        static let deleteAccount = "DeleteAccount"
        static let exercise = "Exercise"
        static let detailedCalculator = "DetailedCalculator"
        static let activityPopUp = "ActivityPopUp"
    }
    
    enum NibNames {
        static let textField = "CustomTextField"
        static let optionTableCell = "OptionTableViewCell"
        static let optionView = "OptionView"
        static let optionCollectionCell = "OptionCollectionViewCell"
        static let underlinedTableCell = "UnderlinedTableViewCell"
        static let chartBarCollectionCell = "BarCollectionViewCell"
        static let muscleHeader = "MuscleHeaderView"
        static let exerciseCell = "ExerciseTableViewCell"
        static let calculatorInput = "CalculatorInputView"
        static let activityView = "ActivityView"
    }
    
    enum FileNames {
        static let exercises = "Exercises_json"
    }
}
