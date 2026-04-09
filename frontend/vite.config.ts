import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// Proxy /api/* → Prism mock server.
// VITE_MOCK_API_URL is injected via docker-compose; falls back to localhost for local dev.
export default defineConfig({
  plugins: [react()],
  server: {
    host: '0.0.0.0',
    port: 5173,
    proxy: {
      '/api': {
        target: process.env['VITE_MOCK_API_URL'] ?? 'http://localhost:4010',
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/api/, ''),
      },
    },
  },
});
