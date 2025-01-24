# .cursor/templates/feature/component.tpl
import { supabase } from '@/core/supabase'

export const Feature{{name}} = () => (
  <div>{{name}} Component</div>
)
