import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View, Button } from "react-native";
import AsyncStorage from "@react-native-async-storage/async-storage";
import { useState } from "react";

export default function App() {
  const [key, setKey] = useState<number>(0);

  return (
    <View style={styles.container}>
      <Text>
        Tap Write to add keys to the storage. Tap Read to read all existing
        keys.
      </Text>
      <Button
        onPress={async () => {
          let value = Math.random();
          console.debug(`Starting to add key ${key} = ${value}`);
          setKey(key + 1);
          await AsyncStorage.setItem(key.toString(), value.toString());
          console.debug(`Done adding key ${key}`);
        }}
        title="Write"
      />
      <Button
        onPress={async () => {
          console.debug("Starting to read all keys");
          let keys = await AsyncStorage.getAllKeys();
          keys.forEach(async (key) => {
            let value = await AsyncStorage.getItem(key);
            console.debug(`${key} = ${value}`);
          });
        }}
        title="Read"
      />
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});
