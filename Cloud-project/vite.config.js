import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'


// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    react(),
    tailwindcss(),
  ],
  server: {
    host: true, // Allow external connections
    port: 5173, // Default Vite port
    strictPort: true, // Fail if port is already in use
    watch: {
      usePolling: true // Necessary for some Docker setups
    }
  }
})
