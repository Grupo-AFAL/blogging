import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import { resolve, dirname } from 'path'
import { fileURLToPath } from 'url'
import { execSync } from 'child_process'

const __dirname = dirname(fileURLToPath(import.meta.url))

// Get gem paths dynamically
const baliGemPath = execSync('bundle show bali_view_components').toString().trim()
const bloggingPath = resolve(__dirname, '../..')

// Helper to create node_modules alias
const nodeModulesAlias = (pkg: string) => resolve(__dirname, 'node_modules', pkg)

// All npm packages used by bali and blogging
const npmPackages = [
  '@hotwired/stimulus',
  '@hotwired/turbo-rails',
  '@rails/request.js',
  '@rails/activestorage',
  '@rails/actiontext',
  'daisyui',
  'tailwindcss',
  '@glidejs/glide',
  '@popperjs/core',
  '@googlemaps/js-api-loader',
  '@googlemaps/markerclusterer',
  'flatpickr',
  'slim-select',
  'sortablejs',
  'lodash.throttle',
  'lodash.debounce',
  'tippy.js',
  'trix',
  'date-fns',
  'rrule',
  'daisyui'
]

// Create aliases for all npm packages
const npmAliases = Object.fromEntries(
  npmPackages.map(pkg => [pkg, nodeModulesAlias(pkg)])
)

// Bali paths
const baliFrontendPath = resolve(baliGemPath, 'app/frontend/bali')
const baliAssetsPath = resolve(baliGemPath, 'app/assets/javascripts/bali')
const baliComponentsPath = resolve(baliGemPath, 'app/components/bali')

export default defineConfig({
  plugins: [
    RubyPlugin(),
  ],
  resolve: {
    alias: {
      ...npmAliases,
      // Bali utils sub-paths (these need to resolve to assets)
      'bali/utils/domHelpers': resolve(baliAssetsPath, 'utils/domHelpers'),
      'bali/utils/formatters': resolve(baliAssetsPath, 'utils/formatters'),
      'bali/utils/form': resolve(baliAssetsPath, 'utils/form'),
      'bali/utils/time': resolve(baliAssetsPath, 'utils/time'),
      'bali/utils/use-click-outside': resolve(baliAssetsPath, 'utils/use-click-outside'),
      'bali/utils/use-dispatch': resolve(baliAssetsPath, 'utils/use-dispatch'),
      'bali/utils/google-maps-loader': resolve(baliAssetsPath, 'utils/google-maps-loader'),
      // Bali component paths (these resolve to components directory)
      'bali/modal': resolve(baliComponentsPath, 'modal/index.js'),
      'bali/drawer': resolve(baliComponentsPath, 'drawer/index.js'),
      'bali/dropdown': resolve(baliComponentsPath, 'dropdown/index.js'),
      'bali/tooltip': resolve(baliComponentsPath, 'tooltip/index.js'),
      'bali/tabs': resolve(baliComponentsPath, 'tabs/index.js'),
      'bali/carousel': resolve(baliComponentsPath, 'carousel/index.js'),
      'bali/navbar': resolve(baliComponentsPath, 'navbar/index.js'),
      'bali/table': resolve(baliComponentsPath, 'table/index.js'),
      'bali/notification': resolve(baliComponentsPath, 'notification/index.js'),
      'bali/hovercard': resolve(baliComponentsPath, 'hover_card/index.js'),
      'bali/bulk_actions': resolve(baliComponentsPath, 'bulk_actions/index.js'),
      // Bali gem main entry point
      'bali': baliFrontendPath,
      'bali/charts': resolve(baliFrontendPath, 'charts.js'),
      'bali/gantt': resolve(baliFrontendPath, 'gantt.js'),
      'bali/rich-text-editor': resolve(baliFrontendPath, 'rich-text-editor.js'),
      // Blogging paths
      'blogging': resolve(bloggingPath, 'app/javascript/blogging'),
    },
    dedupe: ['@hotwired/stimulus', '@hotwired/turbo-rails']
  },
  optimizeDeps: {
    include: npmPackages
  },
  server: {
    fs: {
      allow: ['.', baliGemPath, bloggingPath]
    }
  }
})
