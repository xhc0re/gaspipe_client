import logging, times
 
var logger = newConsoleLogger()
proc doLog*(level: Level, message: string) = 
    logger.log(level, "::", getTime(), "::" & message)