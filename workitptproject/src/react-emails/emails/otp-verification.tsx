import * as React from 'react'
import {
  Button,
  Column,
  Heading,
  Hr,
  Row,
  Section,
  Text
} from '@react-email/components'
import { EmailLayout } from '../components/layout'

interface Props {
  firstName: string
  lastName: string
  code: string
}
export const OTPVerificationEmail = ({ firstName, lastName, code }: Props) => {
  const title = `Hello ${firstName} ${lastName}, your workitpt account has been created!`
  return (
    <EmailLayout title={title} previewText="OTP Verification">
      <Text>Your account has been successfully created.</Text>
      <Text>
        Please enter the following verification code to verify your account.
      </Text>
      <Hr />
      <Section>
        <Row>
          {code.split('').map((code, index) => (
            <Column key={index}>
              <Text className="bg-gray-100 rounded-md p-4 text-center mr-2">
                {code}
              </Text>
            </Column>
          ))}
        </Row>
      </Section>
    </EmailLayout>
  )
}
OTPVerificationEmail.defaultProps = {
  firstName: 'John',
  lastName: 'Doe',
  code: '123456'
}

export default OTPVerificationEmail
