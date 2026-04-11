import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { RouterProvider, createRouter } from '@tanstack/react-router'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import './index.css'

/// 1. Import de l'arbre de routes généré automatiquement
import { routeTree } from './routeTree.gen'

// 2. Création de l'instance QueryClient (le cache de tes données SQL/API)
const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: 1000 * 60 * 5, // Les images restent "fraîches" 5 minutes
    },
  },
})

// 3. Création de l'instance du Router
// On lui passe l'arbre des routes ET le contexte (ton queryClient)
const router = createRouter({
  routeTree,
  context: {
    queryClient,
  },
})

// 4. Typage du Router pour bénéficier de l'autocomplétion partout (Link, navigate, etc.)
declare module '@tanstack/react-router' {
  interface Register {
    router: typeof router
  }
}

// 5. Rendu de l'application
createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <QueryClientProvider client={queryClient}>
      <RouterProvider router={router} />
    </QueryClientProvider>
  </StrictMode>,
)