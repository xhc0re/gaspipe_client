import threadpool

proc messageListener*() =
    while true:
        let message = spawn stdin.readLine()
        echo "Sending \"", ^message, "\""