import React from 'react'
import { LiveEditor, LiveError, LivePreview, LiveProvider } from 'react-live'
import vsDark from 'prism-react-renderer/themes/vsDark'
class Editor extends React.Component {
  constructor(props) {
    super(props)
    this.callback = null
    if (
      typeof window !== 'undefined' &&
      window.document &&
      window.document.createElement
    ) {
      this.callback = (code) => {
        let textarea = document.getElementById('code_snippet_code')
        if (textarea != 'undefined' && textarea != null) {
          textarea.value = code
        }
      }
    } else {
      this.callback = (code) => {}
    }
  }
  render() {
    return (
      <LiveProvider
        code={this.props.code}
        disabled={this.props.disabled}
        scope={{ React: React }}
        theme={vsDark}
        noInline={true}
        transformCode={(code) => {
          this.callback(code)
          return code
        }}
      >
        <LiveEditor />
        <h2>Preview</h2>
        <hr/>
        <LivePreview />
        <LiveError />
      </LiveProvider>
    )
  }
}

export default Editor
