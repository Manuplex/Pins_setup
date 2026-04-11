import { Button } from "@/components/ui/button"
import { Link } from '@tanstack/react-router'

export default function Hero({ m_block, image }: { m_block: string, image:string }) {
     const imageElement = (
       <div className="w-full md:w-1/2 flex-shrink-0">
         <img 
           src={image}
           alt="Hero Image" 
           className='w-full h-64 md:h-96 object-cover rounded-lg shadow-lg' 
         />
       </div>
     )

     const blocElement = (
       <div className="w-full md:w-1/2 flex items-center justify-center">
         <Bloc />
       </div>
     )

     if (m_block === 'right') {
        return(
            <div className='flex flex-col md:flex-row items-center gap-6 md:gap-8'>
                {blocElement}
                {imageElement}
            </div>
        )
     }
     else {
        return(
            <div className='flex flex-col md:flex-row-reverse items-center gap-6 md:gap-8'>
                {blocElement}
                {imageElement}
            </div>
        )
     }
}

export const Bloc = () => {
    return(
        <div className='flex flex-col gap-4 md:gap-6 px-4 md:px-0'>
            <h2 className='text-xl md:text-3xl lg:text-4xl font-bold text-foreground text-center md:text-left'>Fall in love with your next Desktop Setup</h2>
            <p className='text-sm md:text-base text-muted-foreground text-center md:text-left leading-relaxed'>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Delectus repellendus excepturi iusto quos suscipit</p>
            <div className='flex justify-center md:justify-start'>
              <Link to="/gallery">
                <Button variant="default" size="lg" className="w-full md:w-auto">Get Started</Button>
              </Link>
            </div>
        </div>
    )
}