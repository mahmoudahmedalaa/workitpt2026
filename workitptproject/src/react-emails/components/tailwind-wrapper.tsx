import * as React from 'react'
import { Tailwind } from '@react-email/components'

interface Props extends React.ComponentPropsWithoutRef<typeof Tailwind> {}

export const TailwindWrapper = (props: Props) => {
  return (
    <Tailwind
      config={{
        theme: {
          extend: {
            colors: {
              brand: '#f97315',
              background: '#eaf0f3'
            }
          }
        }
      }}
      {...props}
    />
  )
}
