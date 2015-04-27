import {Socket} from "phoenix"

// let socket = new Socket("/ws")
// socket.join("topic:subtopic", {}, chan => {
// })

let App = {
}

export default App

let messagesContainer = $("#messages")

let socket = new Socket("/ws")
socket.connect()
socket.join("projects:lobby", {}).receive("ok", chan => {
  chan.on("new_build", payload => {
    console.log(payload);
    messagesContainer.append(`<br/>[new] [<span title="${payload.build_started_at}">${payload.project_uid}#${payload.build_number}</span>] ID=${payload.build_id} -- STATUS=${payload.build_status}`)
  })
  chan.on("update_build", payload => {
    console.log(payload);
    messagesContainer.append(`<br/>[update] [<span title="${payload.build_started_at}">${payload.project_uid}#${payload.build_number}</span>] ID=${payload.build_id} -- STATUS=${payload.build_status}`)
  })
})
