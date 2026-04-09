import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// Proxy /api/* → FastAPI backend (default) or Prism mock server.
// VITE_MOCK_API_URL is injected via docker-compose:
//   make up            → http://backend:8000  (FastAPI)
//   make frontend-mock → http://mock-api:4010 (Prism)
// Falls back to localhost:8000 for local-outside-Docker dev.
export default defineConfig({
  plugins: [react()],
  server: {
    host: '0.0.0.0',
    port: 5173,
    proxy: {
      '/api': {
        target: process.env['VITE_MOCK_API_URL'] ?? 'http://localhost:8000',
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/api/, ''),
      },
    },
  },
});
