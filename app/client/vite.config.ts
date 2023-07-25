import { defineConfig } from "vite";
import lightningcss from "vite-plugin-lightningcss";
import react from "@vitejs/plugin-react";

// https://vitejs.dev/config/

export default defineConfig({
  plugins: [
    react(),
    lightningcss({
      browserslist: ">= 0.25%",
    }),
  ],
});
