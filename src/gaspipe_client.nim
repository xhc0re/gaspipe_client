from cli/cli import run, Context
from messaging/messaging import messageListener

when isMainModule:
    run()
    messageListener()
