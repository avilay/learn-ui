import { Stack, useRouter } from "expo-router";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";

export default function App() {
  const router = useRouter();

  function handleCancel() {
    console.log("Do nothing in case of cancel");
    router.dismiss();
  }

  function handleSave() {
    console.log("Save the data");
    router.dismiss();
  }

  return (
    <View style={styles.container}>
      <Stack.Screen
        options={{
          headerTitle: "Edit",
          headerStyle: { backgroundColor: "#f4511e" },
          headerTintColor: "#fff",
          headerTitleStyle: { fontWeight: "bold" },
          headerLeft: () => (
            <Text style={styles.headerButton} onPress={handleCancel}>
              Cancel
            </Text>
          ),
          headerRight: () => (
            <Text style={styles.headerButton} onPress={handleSave}>
              Save
            </Text>
          )
        }}
      />
      <Text>This is a modal</Text>
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
  headerButton: {
    color: "#fff"
  }
});
