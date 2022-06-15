proc writeHelp*() =
  echo """
  GasPipe Chat Client 0.1.0

  Allowed arguments:

  -h | --help : show help
  -v | --version : show version
  -s | --server-address : specifies the server address"
  -p | --port : specifies the server port
    """

proc writeVersion*() =
  echo "GasPipe Chat Client 0.1.0"

