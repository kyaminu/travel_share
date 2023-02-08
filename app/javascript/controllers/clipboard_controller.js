// 参考（というかコピペ）　→　https://kobacchi.com/rails7-stimulus-clipboard-copy-btn/


import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static targets = [ "source", "copy_button" ]

  copy(){
    // ↓ボタンクリック時にテキスト(this.sourceTarget.value)をクリップボードにコピーする
    navigator.clipboard.writeText(this.sourceTarget.value)
    // ↓コピー完了後にボタン（リンク）のテキストを上書きする
    this.copy_buttonTarget.innerHTML = '<i class="bi bi-clipboard-check"></i> Copied!!'
  }
}
