// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: BuildSystem/Execution/action.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// This source file is part of the Swift.org open source project
//
// Copyright (c) 2020 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See http://swift.org/LICENSE.txt for license information
// See http://swift.org/CONTRIBUTORS.txt for the list of Swift project authors

import Foundation
import SwiftProtobuf

import LLBBuildSystemProtocol
import LLBCAS

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

//// Key that represents the evaluation of an action's outputs. The inputs to this action have not been resolved at this
//// stage, so the purpose of the ActionFunction is to resolve the inputs and request the execution of the action.
public struct ActionKey {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  //// Represents what type of action this key represents.
  public var actionType: ActionKey.OneOf_ActionType? = nil

  //// A command line based action key.
  public var command: CommandAction {
    get {
      if case .command(let v)? = actionType {return v}
      return CommandAction()
    }
    set {actionType = .command(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  //// Represents what type of action this key represents.
  public enum OneOf_ActionType: Equatable {
    //// A command line based action key.
    case command(CommandAction)

  #if !swift(>=4.1)
    public static func ==(lhs: ActionKey.OneOf_ActionType, rhs: ActionKey.OneOf_ActionType) -> Bool {
      switch (lhs, rhs) {
      case (.command(let l), .command(let r)): return l == r
      }
    }
  #endif
  }

  public init() {}
}

//// The value for an ActionKey.
public struct ActionValue {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  //// The list of outputs IDs that the action produced. This will be in the same order as requested in
  //// actionType.
  public var outputs: [LLBCAS.LLBPBDataID] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

//// An action execution description for a command line invocation.
public struct CommandAction {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  //// The spec for the action to execute.
  public var actionSpec: LLBBuildSystemProtocol.LLBActionSpec {
    get {return _actionSpec ?? LLBBuildSystemProtocol.LLBActionSpec()}
    set {_actionSpec = newValue}
  }
  /// Returns true if `actionSpec` has been explicitly set.
  public var hasActionSpec: Bool {return self._actionSpec != nil}
  /// Clears the value of `actionSpec`. Subsequent reads from it will return its default value.
  public mutating func clearActionSpec() {self._actionSpec = nil}

  //// The list of artifact inputs required for this action evaluation.
  public var inputs: [Artifact] = []

  //// The list of artifact outputs expected from this action evaluation.
  public var outputs: [Artifact] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _actionSpec: LLBBuildSystemProtocol.LLBActionSpec? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension ActionKey: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = "ActionKey"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "command"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1:
        var v: CommandAction?
        if let current = self.actionType {
          try decoder.handleConflictingOneOf()
          if case .command(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.actionType = .command(v)}
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if case .command(let v)? = self.actionType {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: ActionKey, rhs: ActionKey) -> Bool {
    if lhs.actionType != rhs.actionType {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ActionValue: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = "ActionValue"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "outputs"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.outputs)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.outputs.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.outputs, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: ActionValue, rhs: ActionValue) -> Bool {
    if lhs.outputs != rhs.outputs {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension CommandAction: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = "CommandAction"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "actionSpec"),
    2: .same(proto: "inputs"),
    3: .same(proto: "outputs"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularMessageField(value: &self._actionSpec)
      case 2: try decoder.decodeRepeatedMessageField(value: &self.inputs)
      case 3: try decoder.decodeRepeatedMessageField(value: &self.outputs)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._actionSpec {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if !self.inputs.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.inputs, fieldNumber: 2)
    }
    if !self.outputs.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.outputs, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: CommandAction, rhs: CommandAction) -> Bool {
    if lhs._actionSpec != rhs._actionSpec {return false}
    if lhs.inputs != rhs.inputs {return false}
    if lhs.outputs != rhs.outputs {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}