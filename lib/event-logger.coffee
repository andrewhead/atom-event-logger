# Log all messages to file.  Logs to the default system location.  This lets
# us combine log messages from several Atom plugins.
log = require "electron-log"
log.transports.file.level = "silly"


module.exports = plugin =

  activate: (state) ->
    # Listen for copy and paste events
    atom.commands.onWillDispatch (event) =>

      editor = atom.workspace.getActiveTextEditor()
      fileName = editor.getPath()

      if event.type == "core:copy"
        log.debug "Copied code'", {fileName, text: atom.clipboard.read()}
      else if event.type == "core:paste"
        log.debug "Pasted code", {fileName, text: atom.clipboard.read()}
