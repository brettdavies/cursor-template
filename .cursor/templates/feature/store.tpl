# .cursor/templates/feature/store.tpl
interface {{name}}State {}
interface {{name}}Actions {}

export const use{{name}}Store = createStore<{{name}}State, {{name}}Actions>({
  // Store configuration
})
