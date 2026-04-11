import { createFileRoute } from '@tanstack/react-router'
import Hero from '@/components/hero'

export const Route = createFileRoute('/')({
  component: RouteComponent,
})

function RouteComponent() {
  return (
    <div className='flex flex-col min-h-screen bg-background'>
      {/* Hero Sections */}
      <div className='flex-1 flex flex-col gap-16 md:gap-20 px-4 md:px-8 lg:px-16 py-8 md:py-16 lg:py-20 max-w-7xl mx-auto w-full'>
        <section className='flex items-center'>
          <Hero m_block='right' image="https://i.pinimg.com/1200x/05/42/f0/0542f0471cb0a63ec3902c220db00db1.jpg" />
        </section>

        <div className='h-px bg-border my-4 md:my-8'></div>

        <section className='flex items-center'>
          <Hero m_block='left' image="https://i.pinimg.com/originals/67/4d/51/674d5129deafda835acb1a195e3cedfd.jpg" />
        </section>
      </div>

      {/* CTA Section */}
      <div className='bg-gradient-to-r from-primary/10 to-primary/5 border-t border-border py-12 md:py-16'>
        <div className='max-w-7xl mx-auto px-4 md:px-8 lg:px-16 text-center'>
          <h3 className='text-2xl md:text-3xl font-bold text-foreground mb-4'>Ready to explore?</h3>
          <p className='text-muted-foreground mb-6'>Discover thousands of inspiring designs in our gallery</p>
        </div>
      </div>
    </div>
  )
}
