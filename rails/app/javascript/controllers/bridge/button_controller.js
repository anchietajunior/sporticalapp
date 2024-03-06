import { BridgeComponent } from "@hotwired/strada"

export default class extends BridgeComponent {
  static component = "button"

  connect() {
    super.connect()
    this.notifyBridge()
  }

  notifyBridge() {
    const element = this.bridgeElement
    const image = element.bridgeAttribute("image")
    const side = element.bridgeAttribute("side") || "right"
    const action = element.bridgeAttribute("action")
    this.send(action, { title: element.title, image, side, action }, () => {
      this.element.click()
    })
  }
}
