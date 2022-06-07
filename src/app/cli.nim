import os, commands, parseopt, logging, times
from strutils import parseInt

var logger = newRollingFileLogger("gaspipe_client_rolling.log")

type
    Context* = ref object
        serverAddress: string
        serverPort: int

proc setServerAddress(this: Context, serverAddress: string) =
    this.serverAddress = serverAddress

proc setServerPort(this: Context, serverPort: int) =
    this.serverPort = serverPort

proc cli(): Context =
    if paramCount() == 0:
        writeHelp()
        quit(0)

    var context: Context =
        Context(serverAddress: "nil",
                   serverPort: 0)

    for kind, key, val in getopt():
        case kind
        of cmdLongOption, cmdShortOption:
            case key
            of "help", "h":
                writeHelp()
                quit()
            of "version", "v":
                writeVersion()
                quit()
            of "server-address", "s":
                context.setServerAddress(val)
            of "port", "p":
                try:
                    context.setServerPort(parseInt(val))
                except ValueError:
                    logger.log(lvlError, getTime(), " :: Invalid port number provided by user. Error message: " & getCurrentExceptionMsg())
                    quit("You have provided and invalid port number. Exitting...")
            else: discard
        else: discard
    context

proc run*() =
    let Context: Context = cli()
    echo Context.repr
    echo("GasPipe Client v0.1.0 started!")