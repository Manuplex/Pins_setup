import { createRootRouteWithContext,  Outlet} from '@tanstack/react-router'
import React, { Suspense } from 'react'
import type { QueryClient } from '@tanstack/react-query'
const TanStackRouterDevtools = import.meta.env.PROD
    ? () => null // Ne fait rien en prod
    : React.lazy(() =>
        import('@tanstack/react-router-devtools').then((res) => ({
          default: res.TanStackRouterDevtools,
        })),
      )
import NavbarDemo from  '@/components/resizable-navbar-demo'
export interface MyRouterContext {
  queryClient: QueryClient
}

export const Route = createRootRouteWithContext<MyRouterContext>()({
  component: App,
})

function App() {

  return (
    <>
      <NavbarDemo />
      <Outlet />
      <Suspense fallback={null}>
      <TanStackRouterDevtools position="bottom-right" />
      </Suspense>
    </>
  )
}

