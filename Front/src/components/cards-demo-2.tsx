"use client";

import { type ComponentPropsWithoutRef, type ReactNode } from "react"
import { Link } from '@tanstack/react-router'
import { Button } from "@/components/ui/button"

interface CardProps extends ComponentPropsWithoutRef<"div"> {
  name: string
  Icon: React.ElementType
  description: string
  href: string
  cta: string
  score?: string
  imageId?: number
}

const CardDemo = ({name,  Icon, description, href, cta, score, imageId}: CardProps) => {
  return (
    <div className="max-w-xs w-full group/card">
      <div
        key={name}
        style={{
          backgroundImage: `url(${href})`,
          backgroundSize: 'cover'
        }}
        className="cursor-pointer overflow-hidden relative card h-96 rounded-md shadow-xl max-w-sm mx-auto backgroundImage flex flex-col justify-between p-4"
      >

        <div className="absolute w-full h-full top-0 left-0 transition duration-300 group-hover/card:bg-black opacity-60"></div>
        <div className="flex flex-row items-center space-x-4 z-10">
          <Icon height="100" width="100" alt="Avatar" src="" className="h-10 w-10 rounded-full border-2 object-cover">
            {score}
          </Icon>
          <div className="flex flex-col">
            <p className="font-normal text-base text-gray-50 relative z-10">
              {description}
            </p>
            <p className="text-sm text-gray-400">2 min read</p>
          </div>
        </div>
        <div className="text content">
          <h1 className="font-bold text-xl md:text-2xl text-gray-50 relative z-10">
            {name}
          </h1>
          <p className="font-normal text-sm text-gray-50 relative z-10 my-4">
            {imageId ? (
              <Link to="/gallery/$imageId" params={{ imageId: String(imageId) }}>
                <Button>{cta}</Button>
              </Link>
            ) : (
              <Button onClick={() => window.open(href, '_blank')}>{cta}</Button>
            )}
          </p>
        </div>
      </div>
    </div>
  )
}

export default CardDemo;
