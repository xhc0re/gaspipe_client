import os, commands, parseopt, logging
from strutils import parseInt, intToStr
from tools import doLog

# Default port of the application
const port: int = 2137 

type
    Context* = object
        serverAddress: string
        serverPort: int

proc cli(): Context =
    if paramCount() == 0:
        writeHelp()
        quit(0)

    var context: Context = Context(serverAddress: "", serverPort: port)

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
                context.serverAddress = val
            of "port", "p":
                try:
                    context.serverPort = parseInt(val)
                except ValueError:
                    doLog(lvlError, "Invalid port number provided by user. Error message: " & getCurrentExceptionMsg())
                    quit("You have provided and invalid port number. Exitting...")
            else: discard
        else: discard
    context

proc run*() =
    let context: Context = cli()
    doLog(lvlInfo, "Connecting to " & context.serverAddress & " on port " & intToStr context.serverPort)
    echo("GasPipe Client v0.1.0 started!")