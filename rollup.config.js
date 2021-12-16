import path from 'path'
import typescript from '@rollup/plugin-typescript'
import nodeResolve from '@rollup/plugin-node-resolve'
import scss from 'rollup-plugin-scss'
import postcss from 'postcss'
import autoprefixer from 'autoprefixer'
import livereload from 'rollup-plugin-livereload'

/**
 * @returns {boolean}
 */
const isDevelopment = () => {
  return process.env.NODE_ENV === 'development'
}

/** @type { import('rollup').RollupOptions } */
const config = {
  input: path.resolve(__dirname, 'app/assets/typescript/main.ts'),
  output: {
    file: path.resolve(
      __dirname,
      'app/assets/javascript/spree/admin/startup_wizard.js'
    ),
    sourcemap: true,
    format: 'iife'
  },
  plugins: [
    nodeResolve(),
    typescript(),
    scss({
      processor: () => postcss([autoprefixer()]),
      output: 'app/assets/stylesheets/spree/admin/startup_wizard.css',
      sourceMap: isDevelopment(),
      watch: path.resolve(__dirname, 'app/assets/scss')
    }),
    isDevelopment() && livereload()
  ]
}

export default config
