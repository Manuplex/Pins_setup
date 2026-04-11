import { createFileRoute } from '@tanstack/react-router'
import { FooterSimple } from '@/components/footer-simple'

export const Route = createFileRoute('/About')({
  component: About,
  // C'est ici que la magie opère :
  loader: ({ context }) => {
    // 'context' contient automatiquement ton queryClient !
    console.log('Mon QueryClient est accessible ici :', context.queryClient)
    // Tu peux ici pré-charger tes données SQL via ton API
    // return context.queryClient.ensureQueryData(galeriesQueryOptions)
  },
})

function About(){

    return (<>
    <h1 className="text-xl"> About  page </h1>
    <FooterSimple />
    </>
  )
}