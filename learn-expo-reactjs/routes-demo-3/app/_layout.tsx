import { Stack } from "expo-router";

export default function RootLayout() {
  return (
    <Stack
    // screenOptions={{
    //   headerStyle: { backgroundColor: "#f4511e" },
    //   headerTintColor: "#fff",
    //   headerTitleStyle: { fontWeight: "bold" }
    // }}
    >
      <Stack.Screen name="index" />
      {/*
      This does not seem to do anything despite what is mentioned in the docs
      <Stack.Screen
        name="[profile]"
        getId={({ params }) => String(Date.now())}
      /> */}
    </Stack>
  );
}
