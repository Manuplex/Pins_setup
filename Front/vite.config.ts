import path from "path"
import tailwindcss from "@tailwindcss/vite"
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react-swc'
import { tanstackRouter } from '@tanstack/router-plugin/vite'
import 'urlpattern-polyfill';
import { visualizer } from "rollup-plugin-visualizer";

// https://vite.dev/config/
export default defineConfig(({ mode }) => ({
  plugins: [
    tanstackRouter({
      target: 'react',
      autoCodeSplitting: true,
    }),
    react(),
    tailwindcss(),
    mode === 'analyze' && visualizer({ 
        open: true,
        filename: 'stats.html',
        gzipSize: true 
      }),
    ].filter(Boolean),resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
}))