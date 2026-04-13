import path from "path"
import tailwindcss from "@tailwindcss/vite"
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react-swc'
import { tanstackRouter } from '@tanstack/router-plugin/vite'
import 'urlpattern-polyfill';
import { visualizer } from "rollup-plugin-visualizer";

// https://vite.dev/config/
export default defineConfig({
  plugins: [tanstackRouter({
      target: 'react',
      autoCodeSplitting: true,
    }),react(),tailwindcss(),visualizer({ open: true }),],resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
})
