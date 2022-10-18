import { defineConfig } from 'unocss'
import presetUno from '@unocss/preset-uno'
import presetIcons from '@unocss/preset-icons'
import transformer from '@unocss/transformer-directives'
import { extractorSvelte } from '@unocss/core'
import { FileSystemIconLoader } from '@iconify/utils/lib/loader/node-loaders'

export default defineConfig({
  safelist: [],
  shortcuts: {},
  theme: {
    fontFamily: {
      mono: ['Victor-Mono', 'monospace'],
      serif: ['ui-serif', 'serif'],
      body: ['ui-sans-serif', 'sans-serif'],
    },
  },
  presets: [
    presetUno(),
    presetIcons({
      collections: {
        app: FileSystemIconLoader('./public/assets', (svg) =>
          svg.replace(/black/, 'currentColor')
        ),
      },
    }),
  ],
  extractors: [extractorSvelte],
  transformers: [transformer()],
})
