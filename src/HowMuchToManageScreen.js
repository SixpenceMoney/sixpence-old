import React, { Component } from 'react'
import {
  View,
  Text,
  TextInput,
} from 'react-native'

import styles from './styles'

class HowMuchToManageScreen extends Component {
    constructor(props) {
      super(props)

      this.state = {
        amountToDisplay: '$0.00'
      }
    }

    render() {
      return (
        <View style={ styles.container }>
          <Text testID='HowMuchToManageScreen.title' style={ styles.titleLabel }>
            How much to manage?
          </Text>
          <TextInput
            testID='HowMuchToManageScreen.amount'
            style={ styles.amountField }
            caretHidden={ true }
            autoFocus={ true }
            keyboardType='numeric'
            // TODO: Report this bug where UI Test can't read the value for
            // <TextInput/> when it is focused. `clearTextOnFocus` doesn't change behavior.
            accessibilityLabel={
              this.state.amountToDisplay
            }
            value={
              this.state.amountToDisplay
            }
          />
        </View>
      );
    }
}

export default HowMuchToManageScreen;
