//@ external("env", "getVoid")
declare function getVoid(): Promise<void>;

// Awaiting a Promise<void> completes the suspension with no value: as
// a statement, as the return of a Promise<void> function, and through
// a catch when the awaited import rejects.
export async function voidStmt(): Promise<string> {
  await getVoid();
  return "after-void";
}

export async function voidReturn(): Promise<void> {
  return await getVoid();
}

export async function voidCatch(): Promise<string> {
  try {
    await getVoid();
    return "ok";
  } catch (e) {
    return "caught:" + e;
  }
}

export function msg(): string {
  return "void-boom";
}
