import FrontEnd
import SwiftyLLVM
import Utilities

extension Program {

  /// Compiles the IR of `m` for target `t`.
  ///
  /// - Requires: `m` has been lowered and all required passes have been run.
  public func compileToLLVM(
    _ m: FrontEnd.Module.ID, target t: consuming TargetMachine
  ) throws -> SwiftyLLVM.Module {
    let context = try CodeGenerationContext.transpiling(m, in: self, compilingFor: t)
    return context.release()
  }

}
