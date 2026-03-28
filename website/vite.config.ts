import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'
import { resolve } from 'path'
import { readFileSync } from 'fs'
import yaml from 'yaml'

function yamlPlugin() {
  return {
    name: 'yaml-loader',
    transform(code: string, id: string) {
      if (id.endsWith('.yaml') || id.endsWith('.yml')) {
        const content = readFileSync(id, 'utf-8')
        const parsed = yaml.parse(content)
        return {
          code: `export default ${JSON.stringify(parsed)}`,
          map: null,
        }
      }
    },
  }
}

export default defineConfig({
  base: '/cv/',
  plugins: [react(), tailwindcss(), yamlPlugin()],
  resolve: {
    alias: {
      '@': resolve(__dirname, 'src'),
    },
  },
})
