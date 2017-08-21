import 'react-native';
import React from 'react';
import Renderer from 'react-native-test-utils' // Must be imported after react-native

import HowMuchToManageScreen from '../src/HowMuchToManageScreen';

describe('<HowMuchToManageScreen />', () => {

  const component = Renderer( <HowMuchToManageScreen /> )

  const titleSelector = 'Text[testID="HowMuchToManageScreen.title"]'
  const amountSelector = 'TextInput[testID="HowMuchToManageScreen.amount"]'

  it('shows a title', () => {
    const titleView = component.query(titleSelector)
    const titleText = titleView.text();

    expect(titleText).toEqual('How much to manage?')
  });

  it('shows $0.00 amount', () => {
    const amountView = component.query(amountSelector)
    const amountText = amountView.props.value

    expect(amountText).toEqual('$0.00')
  })

  describe('keyboard', () => {
    it('is numeric (e.g. 01234..)', () => {
      const amountView = component.query(amountSelector)
      const keyboardType = amountView.props.keyboardType

      expect(keyboardType).toEqual('numeric')
    })

    it('focuses immediately', () => {
      const amountView = component.query(amountSelector)
      const focused = amountView.props.autoFocus

      expect(focused).toBe(true)
    })

    it("doesn't show a blinking cursor", () => {
      const amountView = component.query(amountSelector)

      expect(amountView.props.caretHidden).toBe(true)
    })
  })
})
