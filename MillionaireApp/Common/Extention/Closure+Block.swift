// LearningApp, 2023

import Foundation

typealias VoidBlock = () -> Void
typealias VoidBlockWithParameters<T> = (T) -> Void
typealias Block<T> = () -> T
typealias BlockWithParameters<T,F> = (T) -> F
typealias VoidBlockWithTwoParameters<T,F> = (T,F) -> Void
