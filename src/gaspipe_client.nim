from app/cli import cli, ContextRef

proc run() =
    let contextRef: ContextRef = cli()
    echo contextRef.repr
    echo("GasPipe Client v0.1.0 started!")

when isMainModule:
    run()
