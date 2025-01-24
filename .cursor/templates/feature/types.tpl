# .cursor/templates/feature/types.tpl
import { Database } from '@/types/database.types'

export type {{name}}Data = Database['public']['Tables']['{{table}}']['Row']
