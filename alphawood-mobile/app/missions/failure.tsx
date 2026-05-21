import {
    View,
    Text,
    TouchableOpacity,
    StyleSheet
} from 'react-native';
import { useRouter, useLocalSearchParams } from 'expo-router';

export default function Failure() {
    const router = useRouter();
    const { title } = useLocalSearchParams();

    return (
        <View style={styles.container}>
            <Text style={styles.icon}>🍂</Text>
            <Text style={styles.title}>Mission Failed</Text>
            <Text style={styles.missionName}>{title}</Text>
            <Text style={styles.message}>Better luck next time!</Text>

            <TouchableOpacity
                style={styles.button}
                onPress={() => router.push('/(tabs)/FindMission')}>
                <Text style={styles.buttonText}>Back to Home</Text>
            </TouchableOpacity>
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#f9f9f9',
        padding: 24,
    },
    icon: {
        fontSize: 80,
        marginBottom: 24,
    },
    title: {
        fontSize: 32,
        fontWeight: '500',
        color: '#F44336',
        marginBottom: 8,
        textAlign: 'center',
    },
    missionName: {
        fontSize: 16,
        color: '#666',
        marginBottom: 8,
        textAlign: 'center',
    },
    message: {
        fontSize: 18,
        color: '#888',
        marginBottom: 48,
    },
    button: {
        backgroundColor: '#F44336',
        paddingHorizontal: 40,
        paddingVertical: 16,
        borderRadius: 12,
    },
    buttonText: {
        color: '#fff',
        fontSize: 18,
        fontWeight: '500',
    },
});