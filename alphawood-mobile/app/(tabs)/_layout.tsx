import { Tabs } from 'expo-router';
import { Ionicons } from '@expo/vector-icons';

export default function TabLayout() {
    return (
        <Tabs screenOptions={{
            tabBarActiveTintColor: '#2D6A4F',
            tabBarInactiveTintColor: '#888',
            headerShown: false,
        }}>
            <Tabs.Screen
                name="FindMission"
                options={{
                    title: 'Find Mission',
                    tabBarIcon: ({ color }) => (
                        <Ionicons name="map-outline" size={24} color={color} />
                    ),
                }}
            />

            <Tabs.Screen
                name="Leaderboard"
                options={{
                    title: 'Leaderboard',
                    tabBarIcon: ({ color }) => (
                        <Ionicons name="trophy-outline" size={24} color={color} />
                    ),
                }}
            />

            <Tabs.Screen
                name="Level"
                options={{
                    title: 'Level',
                    tabBarIcon: ({ color }) => (
                        <Ionicons name="star-outline" size={24} color={color} />
                    ),
                }}
            />



            <Tabs.Screen
                name="Logout"
                options={{
                    title: 'Logout',
                    tabBarIcon: ({ color }) => (
                        <Ionicons name="log-out-outline" size={24} color={color} />
                    ),
                }}
            />

        </Tabs>
    );
}