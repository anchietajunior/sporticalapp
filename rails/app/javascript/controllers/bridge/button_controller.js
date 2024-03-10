import { BridgeComponent } from "@hotwired/strada"

export default class extends BridgeComponent {
  static component = "button"

  connect() {
    super.connect()
    this.#notifyBridge()
  }

  #notifyBridge() {
    const element = this.bridgeElement

    const buttonAttributes = {
      title: element.bridgeAttribute("title") || "Save",
      image: element.bridgeAttribute("image") || "",
      side: element.bridgeAttribute("side") || "right",
      action: element.bridgeAttribute("action") || "save"
    }

    this.send(buttonAttributes.action, buttonAttributes, () => {
      this.element.click()
    })
  }
}
