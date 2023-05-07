import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import laravel from 'laravel-vite-plugin';
import path from "path";

// https://vitejs.dev/config/
export default defineConfig({
  build: {
    commonjsOptions: {
      include: ["tailwind.config.js", "node_modules/**"],
    }
  },
  optimizeDeps: {
    include: ["tailwind-config"],
  },
  plugins: [
    laravel([
      'resources/ts/crm/assets/css/app.css',
      'resources/ts/crm/main.tsx'
    ]),
    react()
  ],
  resolve: {
    alias: {
      "tailwind-config": path.resolve(__dirname, "./tailwind.config.js"),
    },
  },
});
