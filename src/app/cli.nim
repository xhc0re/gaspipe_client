import os, commands, parseopt
from strutils import parseInt

type
    ContextObj = object
        serverAddress: string
        serverPort: int
    ContextRef* = ref ContextObj

proc cli*(): ContextRef =
    if paramCount() == 0:
        writeHelp()
        quit(0)
    
    var contextObj: ContextObj

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
                contextObj.serverAddress = val
                echo contextObj
            of "port", "p":
                try:
                    contextObj.serverPort = parseInt(val)
                    echo contextObj
                except ValueError:
                    echo "Invalid port number! Error: ", getCurrentExceptionMsg()
                    quit("You have provided and invalid port number. Exitting...")
            else: discard
        else: discard
    result = ContextRef(serverAddress: contextObj.serverAddress,
                        serverPort: contextObj.serverPort)
    