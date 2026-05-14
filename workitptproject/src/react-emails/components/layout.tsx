import * as React from 'react'
import { TailwindWrapper } from './tailwind-wrapper'
import {
  Body,
  Container,
  Head,
  Heading,
  Html,
  Img,
  Preview,
  Section
} from '@react-email/components'
import path from 'node:path'
import { Footer } from './footer'
import config from '@config/index'

interface Props extends React.PropsWithChildren {
  previewText: string
  title: string
}
export const EmailLayout = ({ children, previewText, title }: Props) => {
  const logoURL = config.app.logoURL
  return (
    <Html>
      <Head />
      <Preview>{previewText}</Preview>
      <TailwindWrapper>
        <Body className="bg-background mx-auto my-auto font-sans p-4">
          <Container>
            <Img src={logoURL} className="mx-auto object-contain h-24" />
            <Heading className="text-center max-w-md mx-auto" as="h4">
              {title}
            </Heading>
            <Section className="px-12 py-6 rounded-md bg-white mb-6">
              {children}
            </Section>
            <Footer />
          </Container>
        </Body>
      </TailwindWrapper>
    </Html>
  )
}
