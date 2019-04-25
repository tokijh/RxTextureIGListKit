//
//  Swift.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

func fatalErrorInDebug(
    message: @autoclosure () -> String = String(),
    file: StaticString = #file,
    line: UInt = #line
    ) -> Swift.Never {
    #if DEBUG
    fatalError(message(), file: file, line: line)
    #else
    print("\(file):\(line): \(message())")
    #endif
}

func abstractMethod(
    function: StaticString = #function,
    file: StaticString = #file,
    line: UInt = #line
    ) -> Swift.Never {
    fatalErrorInDebug(message: "'\(function)' is abstract method", file: file, line: line)
}
