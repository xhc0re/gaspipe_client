from cli/cli import run, Context

when isMainModule:
    run()
    let message = stdin.readLine
    echo "Sending \"", message, "\""
