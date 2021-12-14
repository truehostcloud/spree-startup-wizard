import path from 'path'
import typescript from '@rollup/plugin-typescript'

/** @type { import('rollup').RollupOptions } */
const config = {
  input: path.resolve(__dirname, 'app/assets/typescript/main.ts'),
  output: {
    file: path.resolve(
      __dirname,
      'app/assets/javascript/spree/admin/startup_wizard.js'
    ),
    format: 'iife'
  },
  plugins: [typescript()]
}

export default config
