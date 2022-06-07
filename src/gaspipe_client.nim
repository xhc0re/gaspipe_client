from app/cli import cli, ContextRef

when isMainModule:
  let contextRef: ContextRef = cli()
  echo contextRef.repr
  echo("GasPipe Client v0.1.0 started!")
