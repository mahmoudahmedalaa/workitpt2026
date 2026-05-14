import config from '@config/index'
import {
  Button,
  Column,
  Heading,
  Hr,
  Img,
  Row,
  Section,
  Text
} from '@react-email/components'
import * as React from 'react'

export const Footer = () => {
  const currentYear = new Date().getFullYear()
  return (
    <Section className="px-12 py-6 rounded-md bg-white">
      <Heading as="h2">Download Our App for Better Experience</Heading>
      <Text>Get the most of WorkitPT by installing our mobile app.</Text>
      <Text>You can login by using existing email address and password</Text>
      <Hr />
      <Section>
        <Row>
          <Column>
            <Button href={config.app.playStoreURL}>
              <Img src={config.app.playStoreIconURL} className="h-16" />
            </Button>
          </Column>
          <Column>
            <Button href={config.app.appStoreURL}>
              <Img src={config.app.appStoreIconURL} className="h-16" />
            </Button>
          </Column>
        </Row>
        <Hr />
        <Text className="text-center font-bold">
          Copyright &copy; {currentYear}
        </Text>
      </Section>
    </Section>
  )
}
