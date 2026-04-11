import { type ComponentPropsWithoutRef, type ReactNode } from "react"

import { cn } from "@/lib/utils"

interface BentoGridProps extends ComponentPropsWithoutRef<"div"> {
  children: ReactNode
  className?: string
}



const BentoGrid = ({ children, className, ...props }: BentoGridProps) => {
  return (
    <div
      className={cn(
        "grid max-w-4xl mx-auto gap-20 md:auto-rows-[20rem]",
        className
      )}
      {...props}
    >
      {children}
    </div>
  )
}


export default BentoGrid
