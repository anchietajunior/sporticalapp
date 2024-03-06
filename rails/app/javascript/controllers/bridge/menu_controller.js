import { BridgeComponent } from "@hotwired/strada"

export default class extends BridgeComponent {
  static component = "menu"
  static targets = ["edit", "delete"]

  connect() {
    super.connect()
    this.notifyBridge()
  }

  notifyBridge() {
    this.send("edit", {}, () => {
      this.editTarget.click()
    })

    this.send("delete", {}, () => {
      this.deleteTarget.click()
    })
  }
}
