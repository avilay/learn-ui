import { Stack } from "expo-router";
import { StatusBar } from "expo-status-bar";
import { useState } from "react";
import { StyleSheet, Text, View, Image, Button } from "react-native";

// eslint-disable-next-line @typescript-eslint/no-unused-vars
function LogoTitle(props: {
  children: string;
  tintColor?: string | undefined;
}) {
  const uri = "https://reactnative.dev/img/tiny_logo.png";
  return <Image style={styles.image} source={{ uri: uri }} />;
}

export default function App() {
  const [count, setCount] = useState(0);

  return (
    <View style={styles.container}>
      <Stack.Screen
        options={{
          headerTitle: (props) => <LogoTitle {...props} />,
          headerRight: () => (
            <Button
              onPress={() => {
                setCount(count + 1);
              }}
              title={`Update count ${count}`}
            />
          )
        }}
      />
      <Text style={styles.para}>
        <Text>Hello, world! No need for a header or a link back to Index</Text>
        <Text>because Stack has already provided it.</Text>
      </Text>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "flex-start",
    backgroundColor: "aliceblue",
    padding: 20
  },
  title: {
    fontSize: 20,
    fontWeight: "bold",
    marginBottom: 50
  },
  para: {
    marginTop: 20,
    marginBottom: 10
  },
  image: {
    height: 50,
    width: 50
  }
});
