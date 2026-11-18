// Diagnostic fixture: await positions that stay loud after hoisting.
// Awaits in short-circuited positions (right of &&/||, ternary branches)
// cannot be hoisted without changing evaluation order; loop conditions
// and incrementors inside a try are guarded by the desugar (`!stop &&`
// / ternary), which puts the await on the short-circuited side; an await
// in a switch condition stays loud (the switch itself transforms now —
// only the condition/case-label await is rejected); compound assignment
// as a subexpression would read its target after the suspension.
//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;
//@ external("env", "getNum")
declare function getNum(i: i32): Promise<i32>;
//@ external("env", "getFlag")
declare function getFlag(i: i32): Promise<bool>;

export function combine(a: string, b: string): string {
  return a + b;
}

export async function andRight(): Promise<string> {
  let f = true;
  if (f && await getFlag(0)) {
    return "YES";
  }
  return "NO";
}

export async function orRight(): Promise<string> {
  let f = false;
  if (f || await getFlag(0)) {
    return "YES";
  }
  return "NO";
}

export async function ternaryThen(): Promise<string> {
  let f = true;
  return f ? await getChunk(0) : "no";
}

export async function ternaryElse(): Promise<string> {
  let f = false;
  return f ? "yes" : await getChunk(0);
}

export async function switchCond(): Promise<string> {
  switch (await getNum(0)) {
    case 0: return "zero";
    default: return "other";
  }
}

export async function whileCondInTry(): Promise<string> {
  let out = "";
  try {
    while (await getFlag(0)) {
      out += await getChunk(0);
      break;
    }
  } catch (e) {
    out += "!";
  }
  return out;
}

export async function forCondInTry(): Promise<string> {
  let out = "";
  try {
    for (let i = 0; await getFlag(i); i++) {
      out += await getChunk(i);
    }
  } catch (e) {
    out += "!";
  }
  return out;
}

export async function doCondInTry(): Promise<string> {
  let out = "";
  let i = 0;
  try {
    do {
      out += await getChunk(i);
      i++;
    } while (await getFlag(i));
  } catch (e) {
    out += "!";
  }
  return out;
}

export async function forIncrInTry(): Promise<string> {
  let out = "";
  try {
    for (let i = 0; i < 2; i += await getNum(1)) {
      out += await getChunk(i);
    }
  } catch (e) {
    out += "!";
  }
  return out;
}

export async function compoundSubexpr(): Promise<i32> {
  let n = 10;
  return (n += await getNum(1));
}
