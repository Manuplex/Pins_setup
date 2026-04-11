import { createRootRouteWithContext,  Outlet} from '@tanstack/react-router'
import type { QueryClient } from '@tanstack/react-query'
import { TanStackRouterDevtools } from '@tanstack/react-router-devtools'
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
      <TanStackRouterDevtools position="bottom-right" />
    </>
  )
}

